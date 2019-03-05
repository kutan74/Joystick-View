//
//  HeadlinesTitleView.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 3.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

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
    
    var leftDividerTrailingConstraint : NSLayoutConstraint!
    var rightDividerLeadingConstraint : NSLayoutConstraint!
    
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
        
        leftDivider.anchor(top: nil, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 8),size: .init(width: 0, height: 1))
        leftDivider.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        leftDividerTrailingConstraint = leftDivider.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant : -8)
        leftDividerTrailingConstraint.isActive = true
        
        rightDivider.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        rightDivider.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        rightDividerLeadingConstraint = rightDivider.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant : 8)
        rightDividerLeadingConstraint.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func animateDividersOnNewStories(title : String){
        
        leftDividerTrailingConstraint.constant = -200
        rightDividerLeadingConstraint.constant = 200
        
        UIView.animate(withDuration: 0.2, animations: {
            
            self.layoutIfNeeded()
            
        }) { (done) in
            if done {
                
                self.leftDividerTrailingConstraint.constant = -8
                self.rightDividerLeadingConstraint.constant = 8
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.layoutIfNeeded()
                    
                }, completion: { (done) in
                    if done {
                        self.titleLabel.text = title
                    }
                })
                
            }
        }
        
    }
    
}

