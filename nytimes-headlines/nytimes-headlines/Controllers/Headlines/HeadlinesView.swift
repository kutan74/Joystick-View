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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [titleView].forEach {
            addSubview($0)
        }
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        titleView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
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
