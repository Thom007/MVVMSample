//
//  ViewControllerSample.swift
//  ParseJSONDataWithStoryboardWithEmbededLinks
//
//  Created by for Work on 5/25/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

public class TableViewControler: UITableViewController {
    
    var viewModel = ArticleViewModel()
    var tableViewData = [ArticleModel]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "News Articles"
        viewModel.fetchArticles { tableViewData in
            self.tableViewData = tableViewData ?? [] //put data into tableViewData2 before reload
            self.tableView.reloadData()
        }
        
    }
}

extension TableViewControler {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let fetchData = tableViewData[indexPath.row]
        let titleLabel = cell.viewWithTag(10) as? UILabel
        titleLabel?.text = fetchData.title
        
        let nameLabel = cell.viewWithTag(20) as? UILabel
        nameLabel?.text = fetchData.source?.name
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) != nil {
            let urlString = tableViewData[indexPath.row].url
            guard let url = urlString else {
                return
            }
            let link = URL(string: url)
            UIApplication.shared.open(link!)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
