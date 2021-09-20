//
//  NewsViewController.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import UIKit
import HGPlaceholders

class NewsViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var tableView: TableView!

    // MARK: Properties

    var refreshControll = UIRefreshControl()
    var presenter: NewsPresentation!
    var news: [Article] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        presenter.viewDidLoad()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = "NEWS"
    }
    
    func setupView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.placeholderDelegate = self
        tableView.adjustedContentInsetDidChange()
        tableView.register(NewsTableViewCell.self)
        
        // add reload uibarbutton item
        
      
        
        
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(self.didReloadNews(_:)), for: .valueChanged)
        
        
    }
    
    @objc func didReloadNews(_ sender: UIRefreshControl) {
        presenter.didReloadFetchNews()
        sender.endRefreshing()
    }
    
    
    
}

extension NewsViewController: NewsView {

    func showNewsData(_ data: [Article]) {
        self.news = data
    }
    
    func showEmptyData() {
        self.tableView.showNoResultsPlaceholder()
    }
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
        
        let article = news[indexPath.row]
        
      
        
        cell.selectionStyle = .none
        cell.setup(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedNews(self.news[indexPath.row])
    }
}


extension NewsViewController: PlaceholderDelegate {
    
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        presenter.didReloadFetchNews()
    }
    
}
