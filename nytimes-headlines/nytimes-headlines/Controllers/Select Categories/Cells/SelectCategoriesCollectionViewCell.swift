//
//  SelectCategoriesCollectionViewCell.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 28.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SelectCategoriesCollectionViewCell : UICollectionViewCell {
    
    let titleLabel : UILabel = {
       
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.veryLightPinkTwo.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func onCellSelected(){
        
        layer.borderColor = UIColor.dustyBlue.cgColor
        titleLabel.textColor = UIColor.dustyBlue
        
    }
    
}
