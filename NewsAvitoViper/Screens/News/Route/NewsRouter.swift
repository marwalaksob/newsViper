//
//  NewsRouter.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import Foundation
import UIKit

class NewsRouter {

    // MARK: Properties

    weak var viewController: UIViewController?

    // MARK: Static methods
}

extension NewsRouter: NewsWireframe {
    
    func openNewsDetail(withNews news: Article) {
        let detailNews = NewsDetailRouter.assembleModule(news)
        detailNews.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(detailNews, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        let view =  UIStoryboard.loadViewController() as NewsViewController
        let presenter = NewsPresenter()
        let router = NewsRouter()
        let interactor = NewsInteractor()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    // TODO: Implement wireframe methods
}
