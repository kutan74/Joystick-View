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
        articlesCollectionView.isPagingEnabled = true
        
        addSubview(articlesCollectionView)
        articlesCollectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: changeCategoryButton.topAnchor, traling: trailingAnchor, padding: .init(top: 30, left: 22, bottom: 20, right: 22), size: .init(width: UIScreen.main.bounds.size.width - 44, height: UIScreen.main.bounds.size.height - 120))
        
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
        categoriesCollectionView.layer.borderColor = UIColor.brownGrey.withAlphaComponent(0.2).cgColor
        categoriesCollectionView.layer.borderWidth = 1.0
        categoriesCollectionView.clipsToBounds = true
        
        addSubview(categoriesCollectionView)
        categoriesCollectionView.anchor(top: nil, leading: leadingAnchor, bottom: changeCategoryButton.topAnchor, traling: trailingAnchor, padding: .init(top: 8, left: 20, bottom: 10, right: 20), size: .init(width: 0, height: 182))
        
        categoriesCollectionView.isHidden = true
        
        
    }
    
    func enableCategorySelection(){
        
        changeCategoryButtonGhost.alpha = 0.7
        categoriesCollectionView.isHidden = false
        
    }
    
    func disableCategorySelectiob(){
        
        changeCategoryButtonGhost.alpha = 1.0
        categoriesCollectionView.isHidden = true
        bringSubviewToFront(changeCategoryButtonGhost)
    }
    
}

final class HeadlinesTitleView : UIView {
    
    let titleLabel : UILabel = {
       
        let label = UILabel()
        label.text = "HEADLINES"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        return label
        
    }()
    
    let leftDivider : UIView = {
       
        let view = UIView()
        view.backgroundColor = UIColor.brownGrey
        return view
        
    }()
    
    let rightDivider : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.brownGrey
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [titleLabel,leftDivider,rightDivider].forEach {
            addSubview($0)
        }
        
        setupViews()
        
    }
    
    func setupViews(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        leftDivider.anchor(top: nil, leading: leadingAnchor, bottom: nil, traling: titleLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8),size: .init(width: 0, height: 1))
        leftDivider.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        rightDivider.anchor(top: nil, leading: titleLabel.trailingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        rightDivider.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
}

final class HeadlinesRemaningArticleView : UIView {
    
    let holderView : UIView = {
       
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.brownGrey.cgColor
        view.layer.borderWidth = 1.0
        view.clipsToBounds = true
        return view
        
    }()
    
    let progressView : UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        return view
        
    }()
    
    let remaningArticleLeftLabel : UILabel = {
       
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.bold)        
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [holderView,progressView,remaningArticleLeftLabel].forEach {
            addSubview($0)
        }
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        holderView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15), size: .init(width: 0, height: 8))
        
        progressView.anchor(top: holderView.topAnchor, leading: holderView.leadingAnchor, bottom: holderView.bottomAnchor, traling: nil, padding: .zero, size: .init(width: 30, height: 8))
        
        remaningArticleLeftLabel.anchor(top: holderView.bottomAnchor, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 3, left: 17, bottom: 0, right: 0))
                
    }
    
}
