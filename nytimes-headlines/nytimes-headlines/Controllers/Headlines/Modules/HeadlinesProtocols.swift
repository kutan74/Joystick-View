//
//  HeadlinesProtocols.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

protocol HeadlinesPresenterToViewProtocol : class {
    
    func setNews(articles : [Article]?)
    
}

protocol HeadlinesViewToPresenterProtocol : class {
    
    var view : HeadlinesPresenterToViewProtocol? {get set}
    var interactor : HeadlinesPresenterToInteractorProtocl? {get set}
    var router : HeadlinesPresenterToRouterProtocol? {get set}
    
}

protocol HeadlinesPresenterToInteractorProtocl : class {
    var presenter : HeadlinesInteractorToPresenterProtocol? {get set}
    
    func loadNews()
    
}

protocol HeadlinesInteractorToPresenterProtocol {
    
    func newsLoaded(articles : [Article]?)
    
}

protocol HeadlinesPresenterToRouterProtocol : class {
    
}

