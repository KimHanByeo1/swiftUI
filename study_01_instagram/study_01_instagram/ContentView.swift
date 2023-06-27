//
//  ContentView.swift
//  study_01_instagram
//
//  Created by 김한별 on 2023/04/05.
//

import SwiftUI

struct ContentView: View {
    @State var model: [ImageJson] = []
    var body: some View {
        Text("Hello")
            .onAppear(
                apiCall().getUsers{ (model) in
                    self.model = model
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct CardView: View {
//    var body: some View {
//        VStack {
//            Image("swiftui-button")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            HStack {
//                VStack(alignment: .leading) {
//                    Text("SwiftUI")
//                        .font(.headline)
//                        .foregroundColor(.secondary)
//                    Text("Drawing a Border with Rounded Corners")
//                        .font(.title)
//                        .fontWeight(.black)
//                        .foregroundColor(.primary)
//                        .lineLimit(3)
//                    Text("Written by Simon Ng".uppercased())
//                        .font(.caption)
//                        .foregroundColor(.secondary)
//                }
//            Spacer()
//            }
//            .padding() }
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
//                          opacity: 0.1), lineWidth: 1)
//            )
//            .padding([.top, .horizontal])
//    }
//}


//protocol MyViewProtocol {
//    var title: String { get }
//    func getJSONData()
//}

var dbModel: [DBModel] = []

struct MyView: View, QueryModelProtocal {
    
    func itemDownLoaded(items: [DBModel]) {
        dbModel = items
    }
    
//    var items = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        List {
//            ForEach(dbModel, id: \.self) { item in
//                Text(item.imageURL)
//                Text(item.name)
//                Text(item.content)
//            }
        }
    }
    
    func getJSONData() {
        let model = QueryModel()
        model.delegate = self
        model.downloadItems()
    }
    
}
