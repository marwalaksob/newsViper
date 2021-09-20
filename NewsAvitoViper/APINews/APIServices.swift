//
//  APIServices.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import Foundation
import Alamofire
import RxSwift

class APIServices {
    
    
    
    static func fetchNews() -> Observable<News> {
        
        return Observable<News>.create({ observer -> Disposable in
            print("URL :", Endpoints.News.headline.url)
            let request =  AF
                .request(Endpoints.News.headline.url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(News.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
        
    }
    
    
    
    static func fetchNewsCategory(_ category: String) -> Observable<News> {
        
        return Observable<News>.create({ observer -> Disposable in
            print("URL :", Endpoints.News.category(category: category).url)
            let request =  AF
                .request(Endpoints.News.category(category: category).url)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(News.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
        
    }
    
  
    
}
