//
//  ModelsSample.swift
//  ParseJSONDataWithStoryboardWithEmbededLinks
//
//  Created by for Work on 5/25/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ArticleModel: Mappable {
    
    var url: String?
    var title: String?
    public var source: SourceModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        title <- map["title"]
        source <- map["source"]
    }
}

class SourceModel: Mappable {
    
    var id: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

class URLResponse: Mappable { 

    var articles: [ArticleModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        articles <- map["articles"]
    }
}

