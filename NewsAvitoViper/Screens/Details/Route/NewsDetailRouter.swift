//
//  NewsDetailRouter.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import Foundation
import UIKit

class NewsDetailRouter {

    static func assembleModule(_ article: Article) -> UIViewController {
        let viewController = UIStoryboard.loadViewController() as NewsDetailViewController
        let presenter = NewsDetailPresenter()
        let interactor = NewsDetailInteractor()
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.interactor = interactor
        
        presenter.article = article
        
        return viewController
    }
}
