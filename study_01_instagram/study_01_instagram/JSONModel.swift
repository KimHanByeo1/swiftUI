//
//  JSONModel.swift
//  study_01_instagram
//
//  Created by 김한별 on 2023/04/05.
//

import Foundation
import SwiftUI

struct ImageJson: Codable, Identifiable {
    let id = UUID()
    var images: String
    var model: String
    var content: String
}
