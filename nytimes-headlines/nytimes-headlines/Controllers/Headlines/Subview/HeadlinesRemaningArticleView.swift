//
//  HeadlinesRemaningArticleView.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 3.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

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
