//
//  viewModel.swift
//  study_01_instagram
//
//  Created by 김한별 on 2023/04/05.
//

import Foundation

class apiCall {
    func getUsers(completion:@escaping ([ImageJson]) -> ()) {
        guard let url = URL(string: "https://sunhyongkwon.github.io/data.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([ImageJson].self, from: data!)
            print(users)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
}
