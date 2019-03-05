//
//  HeadlinesViewController.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import SkeletonView

class HeadlinesViewController : BaseViewController {
    
    var subView = HeadlinesView()
    var presenter : HeadlinesViewToPresenterProtocol?
    
    var articles : [Article]!
    var categories : [HeadlineCategory] = []
    
    var currentHoveredItemIndex = -1
    
    var gestureHelper : HeadlineCategoryGestureHelper!
    
    // Seperated UICollectionView datasource from the VC to avoid a massive VC
    var datasource : HeadlinesDatasource!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        self.setupViews()
    }
    
    // MARK: Subview
    func setupViews(){
     
        self.gestureHelper = HeadlineCategoryGestureHelper()
        
        self.layoutSubview(for: self.subView)
        self.title = "New York Times"
        self.presenter?.interactor?.loadNews()
        
        self.subView.changeCategoryButtonGhost.isUserInteractionEnabled = true
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.subView.changeCategoryButtonGhost.addGestureRecognizer(gestureRecognizer)
        
    }
    
    // MARK: CollectionView Datasource
    func setCollectionViewDatasource(){
        
        self.gestureHelper.categories.forEach {
            self.categories.append(HeadlineCategory(title: $0))
        }
                
        self.datasource = HeadlinesDatasource(for: self.subView.articlesCollectionView, with: self.articles, for: self.subView.categoriesCollectionView, for: self.categories, ghostView: self.subView.changeCategoryButtonGhost)
        
        self.subView.articlesCollectionView.delegate = self.datasource
        self.subView.articlesCollectionView.dataSource = self.datasource
        
        self.subView.categoriesCollectionView.delegate = self.datasource
        self.subView.categoriesCollectionView.dataSource = self.datasource
    }
    
}

// MARK: Presenter to View
extension HeadlinesViewController : HeadlinesPresenterToViewProtocol {
    
    func setTopStories(articles: [Article]?) {
        
        guard let _articles = articles else {
            return
        }
        
        self.subView.updateSectionTitle(title: self.categories[self.currentHoveredItemIndex].title.uppercased())
        self.articles = _articles
        self.datasource.updateData(for: self.articles)
        
    }
    
    func setNews(articles: [Article]?) {
        
        guard let _articles = articles else {
            return
        }
               
        self.articles = _articles
        self.setCollectionViewDatasource()
        
    }
    
}

// MARK: GestureRecognizer
extension HeadlinesViewController {
    
    func draggedView(sender:UIPanGestureRecognizer){
        
        let translation = sender.translation(in: self.view)
        self.subView.changeCategoryButton.center = CGPoint(x: self.subView.changeCategoryButton.center.x + translation.x, y: self.subView.changeCategoryButton.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            gestureRecognizer.view?.center = .init(x: self.subView.categoriesCollectionView.center.x, y: self.subView.categoriesCollectionView.center.y)
            self.subView.enableCategorySelection()
            
        }else if gestureRecognizer.state == .changed {
            
            guard let _ = self.articles else {
                return
            }
            
            let translation = gestureRecognizer.translation(in: self.subView)
            
            // Get the current hovered item
            let hoveredItem = self.gestureHelper.getCurrentHoveredItemIndex(ghosView: gestureRecognizer.view!,collectionViewFrame: self.subView.categoriesCollectionView.frame)
            
            
            
            self.currentHoveredItemIndex = hoveredItem
            self.datasource.hoveredItem = self.currentHoveredItemIndex
            self.subView.categoriesCollectionView.reloadData()
            
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y * 1.25)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.subView)
        
        }else if gestureRecognizer.state == .ended {
            
            self.subView.disableCategorySelection()
            
            if self.currentHoveredItemIndex > 0 && self.currentHoveredItemIndex < self.categories.count - 1 {
                self.datasource.showSkeleton()
                self.presenter?.interactor?.loadTopStories(by: self.categories[self.currentHoveredItemIndex].title)
            }
            
            gestureRecognizer.view!.center = self.subView.changeCategoryButton.center
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.subView)
            
        }else {
            return
        }
    }
    
}
