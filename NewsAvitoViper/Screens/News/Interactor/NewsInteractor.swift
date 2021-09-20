//
//  NewsInteractor.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import RxSwift

class NewsInteractor {
    weak var output: NewsInteractorOutput!
    private var disposeBag = DisposeBag()
}

extension NewsInteractor: NewsUseCase {
    
    func fetchOtherCategory(_ category: String) {
        APIServices.fetchNewsCategory(category)
            .subscribe(onNext: { news in
                self.output.otherCategoryFetched(news)
            }, onError: { error in
                self.output.failedFetchOtherCategory()
            }).disposed(by: disposeBag)
    }
    
    
    
    func fetchNews() {
        APIServices.fetchNews()
            .subscribe(onNext: { news in
                self.output.newsFetched(news)
            }, onError: { error in
                self.output.failedFetchNews()
            }).disposed(by: disposeBag)
    }
    
}
