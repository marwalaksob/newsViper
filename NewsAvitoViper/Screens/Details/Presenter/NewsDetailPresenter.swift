//
//  NewsDetailPresenter.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import Foundation

class NewsDetailPresenter {

    // MARK: Properties

    weak var view: NewsDetailView?
    var router: NewsDetailWireframe?
    var interactor: NewsDetailUseCase?
    var article: Article!
}

extension NewsDetailPresenter: NewsDetailPresentation {
    
    func viewDidLoad() {
        view?.showDetail(forArticle: article)
    }
    
    // TODO: implement presentation methods
}

extension NewsDetailPresenter: NewsDetailInteractorOutput {
    // TODO: implement interactor output methods
}
