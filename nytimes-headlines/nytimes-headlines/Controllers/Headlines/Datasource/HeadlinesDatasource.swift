//
//  HeadlinesDatasource.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 28.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlinesDatasource : NSObject,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var articlesCollectionView : UICollectionView!
    var categoriesCollectionView : UICollectionView!
    
    var articles : [Article]?
    var categories : [HeadlineCategory]!
    
    var ghostView : UIView!
    
    var hoveredItem = 0
    
    init(for articlesCollectionView : UICollectionView, with articles : [Article]? , for categoriesCollectionView : UICollectionView, for categories : [HeadlineCategory],ghostView : UIView!) {
        
        self.articlesCollectionView = articlesCollectionView
        self.articles = articles
        
        self.categoriesCollectionView = categoriesCollectionView
        self.categories = categories
        
        self.ghostView = ghostView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.articlesCollectionView {
            return self.articles?.count ?? 0
        }else {
            return self.categories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.articlesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! HeadlineCollectionViewCell
            
            let article = self.articles![indexPath.row]
            cell.articleTitle.text = article.title!
            cell.articleContent.text = article.abstract!
            
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
            
            let category = self.categories[indexPath.row]
            cell.categoryTitle.text = category.title
            
            if indexPath.row == hoveredItem {
                cell.backgroundColor = UIColor.dustyBlue
                cell.categoryTitle.textColor = .white
            }else {
                cell.backgroundColor = UIColor.clear
                cell.categoryTitle.textColor = .black
            }
            
            return cell
            
        }
        
    }
    
}
