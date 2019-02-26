//
//  HeadlinesViewController.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlinesViewController : BaseViewController {
    
    var subView = HeadlinesView()
    var presenter : HeadlinesViewToPresenterProtocol?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        self.setupViews()
        
    }
    
    // MARK: Subview
    func setupViews(){
     
        self.layoutSubview(for: self.subView)
        self.title = "New York Times"
        self.presenter?.interactor?.loadNews()
        
    }
    
}

extension HeadlinesViewController : HeadlinesPresenterToViewProtocol {
   
    func setNews(articles: [Article]?) {
        
    }
    
    
    
    
}
