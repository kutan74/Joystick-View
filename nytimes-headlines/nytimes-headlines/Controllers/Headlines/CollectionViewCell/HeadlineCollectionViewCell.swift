//
//  HeadlineCollectionViewCell.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlineCollectionViewCell : UICollectionViewCell {
    
    let articleTitle : UILabel = {
       
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        
    }()
    
    let articleContent : UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 18.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [articleTitle,articleContent].forEach {
            addSubview($0)
        }
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        //layer.cornerRadius = 5
        //layer.borderColor = UIColor.veryLightPinkTwo.cgColor
        //layer.borderWidth = 1.0
        //clipsToBounds = true
        
        articleTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 12, left: 37, bottom: 0, right: 15))
        articleTitle.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 74).isActive = true
        
        articleContent.anchor(top: articleTitle.bottomAnchor, leading: articleTitle.leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 12, left: 0, bottom: 15, right: 15))
        articleContent.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
    }
    
}
