//
//  HeadlinesRouter.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlinesRouter : HeadlinesPresenterToRouterProtocol {
    
    static func makeModule() -> UIViewController {
        
        let view = HeadlinesViewController()
        let presenter : HeadlinesViewToPresenterProtocol & HeadlinesInteractorToPresenterProtocol = HeadlinesPresenter()
        presenter.view = view
        presenter.interactor = HeadlinesInteractor()
        presenter.router = HeadlinesRouter()
        presenter.interactor?.presenter = presenter
        view.presenter = presenter
        return view
        
    }
    
}
