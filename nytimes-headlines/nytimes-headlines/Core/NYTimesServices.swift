//
//  NYTimesServices.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 26.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import Moya

import Foundation
import Moya

enum NYTimesServices {
    
    case getHome()
    case topStories(category : String)
    
}

extension NYTimesServices : TargetType {
    
    var baseURL : URL { return URL(string: "https://api.nytimes.com/svc/")! }
    
    var path: String {
        switch self {
        case .getHome():
            return "mostpopular/v2/viewed/1.json"
        case .topStories(let category):
            return "topstories/v2/\(category).json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHome():
            return .get
        case .topStories(_):
            return .get
        }
        
    }
    
    var task: Task {
        switch self {
        case .getHome():
            return .requestParameters(parameters: ["api-key" : "ULhVgXclfW67BJ4OOqY8aKIFkGZtQtbs"], encoding: URLEncoding.queryString)
        case .topStories(_):
            return .requestParameters(parameters: ["api-key" : "ULhVgXclfW67BJ4OOqY8aKIFkGZtQtbs"], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getHome():
            return "Half measures are as bad as nothing at all.".utf8Encoded
        case .topStories(_):
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


