//
//  HeadlinesInteractor.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import Moya


class HeadlinesInteractor : HeadlinesPresenterToInteractorProtocl {
    
    var presenter: HeadlinesInteractorToPresenterProtocol?
    
    func loadNews() {
        MoyaProvider<NYTimesServices>(plugins : [NetworkLoggerPlugin()]).request(.getHome()) { result in
            if case .success(let response) = result {
                do {
                    let newsResult = try self.decodeResults(from: response.data)
                    self.presenter?.newsLoaded(articles: newsResult)
                }catch {
                    self.presenter?.newsLoaded(articles: nil)
                }
            }
        }
    }
    
    func loadTopStories(by category: String) {
        MoyaProvider<NYTimesServices>(plugins : [NetworkLoggerPlugin()]).request(.topStories(category: category.lowercased())) { result in
            if case .success(let response) = result {
                do {
                    let newsResult = try self.decodeResults(from: response.data)
                    self.presenter?.topStoriesLoaded(articles: newsResult)
                }catch {
                    self.presenter?.topStoriesLoaded(articles: nil)
                }
            }
        }
    }
    
    
}

private extension HeadlinesInteractor {
    func decodeResults(from data: Data) throws -> [Article] {
        
        struct Container: Decodable {                        
            let results: [Article]!
        }
        
        let decoder = JSONDecoder()
        let container = try decoder.decode(Container.self, from: data)
        return container.results
    }
    
    
}
