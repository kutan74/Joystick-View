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
    
    var articles : [Article]!
    var remaningArticlesCount : Int!
    
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
    
    // MARK: CollectionView Datasource
    func setCollectionViewDatasource(){
        self.subView.collectionView.delegate = self
        self.subView.collectionView.dataSource = self
    }
    
}

extension HeadlinesViewController : HeadlinesPresenterToViewProtocol {
   
    func setNews(articles: [Article]?) {
        
        self.articles = articles
        self.remaningArticlesCount = self.articles.count
        
        self.setCollectionViewDatasource()
        self.updateRemaningArticleLeftView()
        
    }
    
    func updateRemaningArticleLeftView(){
        self.subView.remaningArticleView.remaningArticleLeftLabel.text = "\(self.remaningArticlesCount!) Headlines Left"
    }
    
    
}

extension HeadlinesViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HeadlineCollectionViewCell
        
        let article = self.articles[indexPath.row]
        cell.articleTitle.text = article.title!
        cell.articleContent.text = article.abstract!
        
        return cell
        
    }
    
    
    
    
}
