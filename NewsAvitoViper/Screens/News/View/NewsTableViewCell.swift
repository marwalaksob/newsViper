//
//  NewsTableViewCell.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import UIKit


class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var timeNews: UILabel!
    
    func setup(_ news: Article) {
        self.titleNews.text = news.title
        self.timeNews.text = DateHelper.formatPublished(news.publishedAt ?? "")
        
        imageNews.kf.indicatorType = .activity
        
        imageNews.kf.setImage(
            with: URL(string: news.urlToImage ?? "")
        )
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
