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
    var collectionView : UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [titleView,remaningArticleView].forEach {
            addSubview($0)
        }
        
        setupViews()
        setupCollectionView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        titleView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
        remaningArticleView.anchor(top: titleView.bottomAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 28, left: 0, bottom: 0, right: 0))
        
    }
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.size.width, height: 500)
        //layout.estimatedItemSize = .init(width: UIScreen.main.bounds.size.width - 44, height: 260)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout : layout)
        collectionView.register(HeadlineCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        
        addSubview(collectionView)
        collectionView.anchor(top: remaningArticleView.bottomAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: UIScreen.main.bounds.size.height - 120))
        
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
