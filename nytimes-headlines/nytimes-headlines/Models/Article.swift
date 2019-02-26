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
    var adxKeywords : String?
    var column : String?
    var section : String?
    var byLine : String?
    var type : String?
    var title : String?
    var abstract : String?
    var publishedDate : String?
    var source : String?
    var id : Int?
    var assetId : Int?
    var views : Int?
    
    var media : [ArticleMedia]?
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

