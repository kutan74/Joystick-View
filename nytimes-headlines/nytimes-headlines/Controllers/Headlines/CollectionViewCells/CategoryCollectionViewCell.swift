//
//  CategoryCollectionViewCell.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 28.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell : UICollectionViewCell,HoverableCategory {
    
    let categoryTitle : UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        return label
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryTitle)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        categoryTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func enableHover(){
        backgroundColor = UIColor.dustyBlue
        categoryTitle.textColor = .white
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func disableHover(){
        backgroundColor = UIColor.clear
        categoryTitle.textColor = .black
        layer.borderColor = UIColor.black.cgColor
    }
    
}

protocol HoverableCategory {
    
}

extension HoverableCategory where Self : UIView {
    
    func makeHover(){
        self.backgroundColor = UIColor.dustyBlue
    }
    
    func resetHover(){
        self.backgroundColor = .clear
    }
}
