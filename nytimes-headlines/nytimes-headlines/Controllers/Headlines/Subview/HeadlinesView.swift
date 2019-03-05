//
//  HeadlinesView.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

final class HeadlinesView : UIView {
    
    let titleView = HeadlinesTitleView()
    var remaningArticleView = HeadlinesRemaningArticleView()
    
    var articlesCollectionView : UICollectionView!
    var categoriesCollectionView : UICollectionView!
    
    let changeCategoryButton : UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "switchCategory")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    let changeCategoryButtonGhost : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "switchCategory")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 1.0
        imageView.isHidden = false
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [titleView,changeCategoryButton,changeCategoryButtonGhost].forEach {
            addSubview($0)
        }
        
        setupViews()
        
        setupArticlesCollectionView()
        setupCategoriesCollectionView()
        
        bringSubviewToFront(changeCategoryButtonGhost)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        titleView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
        
        changeCategoryButton.anchor(top: nil, leading: nil, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size : .init(width: 48, height: 48))
        changeCategoryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        changeCategoryButtonGhost.anchor(top: nil, leading: nil, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size : .init(width: 48, height: 48))
        changeCategoryButtonGhost.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
    
    func setupArticlesCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .zero
        layout.estimatedItemSize = .init(width: UIScreen.main.bounds.size.width - 44, height: 260)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        articlesCollectionView = UICollectionView(frame: self.frame, collectionViewLayout : layout)
        articlesCollectionView.register(HeadlineCollectionViewCell.self, forCellWithReuseIdentifier: "articleCell")
        
        articlesCollectionView.showsVerticalScrollIndicator = false
        articlesCollectionView.backgroundColor = .clear        
        
        addSubview(articlesCollectionView)
        articlesCollectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: changeCategoryButton.topAnchor, traling: trailingAnchor, padding: .init(top: 30, left: 22, bottom: 8, right: 22), size: .init(width: UIScreen.main.bounds.size.width - 44, height: UIScreen.main.bounds.size.height - 120))
        
    }
    
    func setupCategoriesCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: (UIScreen.main.bounds.size.width - 66) / 4, height: 30)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        categoriesCollectionView = UICollectionView(frame: self.frame, collectionViewLayout : layout)
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        
        categoriesCollectionView.isScrollEnabled = false
        categoriesCollectionView.showsVerticalScrollIndicator = false
        categoriesCollectionView.backgroundColor = .white
        
        addSubview(categoriesCollectionView)
        categoriesCollectionView.anchor(top: nil, leading: leadingAnchor, bottom: changeCategoryButton.topAnchor, traling: trailingAnchor, padding: .init(top: 8, left: 20, bottom: 40, right: 20), size: .init(width: 0, height: 182))
        
        categoriesCollectionView.isHidden = true
                
    }
    
    func enableCategorySelection(){
        
        articlesCollectionView.alpha = 0.1
        changeCategoryButtonGhost.alpha = 0.7
        categoriesCollectionView.alpha = 1.0
        categoriesCollectionView.isHidden = false
        
    }
    
    func disableCategorySelection(){
        
        self.articlesCollectionView.alpha = 1.0
        self.categoriesCollectionView.alpha = 0.0
        self.changeCategoryButtonGhost.alpha = 1.0
        self.categoriesCollectionView.isHidden = true
        self.bringSubviewToFront(self.changeCategoryButtonGhost)
        
    }
    
}
