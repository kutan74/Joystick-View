//
//  Article.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct Article : Codable {
    
    var url : String?
    var title : String?
    var abstract : String?
    
}

struct ArticleMedia : Codable {
    
    var type : String?
    var subType : String?
    var caption : String?
    var copyright : String?
    var approvedForSyndication : Int?
    
    var metaData : [ArticleMediaMeta]?
    var uri : String?
    
    
    struct ArticleMediaMeta : Codable {
        var url : String?
        var format : String?
        var height : Int?
        var width : Int?
    }
    
}

