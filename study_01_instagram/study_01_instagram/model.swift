//  model.swift
//  study_01_instagram
//
//  Created by 김한별 on 2023/04/05.
//

import Foundation
import SwiftUI

protocol QueryModelProtocal {
    func itemDownLoaded(items: [DBModel])
}

class QueryModel {
    var delegate: QueryModelProtocal!
    let urlPath = "https://sunhyongkwon.github.io/data.json"
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        
        //타스트매니저?
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.parseJSON(data!)
            }
        }
    }
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        var locations: [DBModel] = []
        
        do{
            let jsonData = try decoder.decode([ImageJson].self, from: data)
            for data in jsonData {
                let query = DBModel(imageURL: data.images, name: data.model, content: data.content)
                locations.append(query)
            }
        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.delegate.itemDownLoaded(items: locations)
        }
    }
}
