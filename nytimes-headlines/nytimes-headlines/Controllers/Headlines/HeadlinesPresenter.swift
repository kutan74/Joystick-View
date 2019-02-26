//
//  HeadlinesPresenter.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlinesPresenter : HeadlinesViewToPresenterProtocol {
    
    var view: HeadlinesPresenterToViewProtocol?
    var interactor: HeadlinesPresenterToInteractorProtocl?    
    var router: HeadlinesPresenterToRouterProtocol?
    
    
}

extension HeadlinesPresenter : HeadlinesInteractorToPresenterProtocol {
   
    func newsLoaded(articles: [Article]?) {
        self.view?.setNews(articles: articles)
    }
    
    
}
