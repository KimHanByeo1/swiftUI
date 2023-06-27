//
//  DBModel.swift
//  study_01_instagram
//
//  Created by 김한별 on 2023/04/05.
//

import Foundation

struct DBModel {
    var imageURL: String
    var name: String
    var content: String
    
    init(imageURL: String, name: String, content: String) {
        self.imageURL = imageURL
        self.name = name
        self.content = content
    }
}
