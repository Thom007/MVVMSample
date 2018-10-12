//
//  ArticleViewModel.swift
//  MVVMSample
//
//  Created by for Work on 5/28/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import Alamofire
import UIKit

class ArticleViewModel  {
    
    var articles: [ArticleModel] = []
    
}

extension ArticleViewModel {
    
    func fetchArticles (completion: @escaping ([ArticleModel]?) -> ()) {
        /*fetch data -> URLSession code (let session = URLSession.shared.dataTask...)
         or Alamofire cocoapod*/
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49a36c5fd89c4852921acea7351aa95f"
        let url = URL(string: urlString)
        Alamofire.request(url!).responseObject { (response: DataResponse<URLResponse>) in
            completion(response.result.value?.articles)
            }
        }
        //call the completion block
}


