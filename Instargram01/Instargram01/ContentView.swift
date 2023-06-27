//
//  ContentView.swift
//  Instargram01
//
//  Created by 권순형 on 2023/04/05.
//


import SwiftUI
import URLImage

struct ContentView: View, JSONDataProtocol {
    
    @State var items: [Shoe] = []
    @State private var currentIndex: Int = 0
    
    func itemDownLoaded(items: [Shoe]) {
        self.items = items
    }

    var body: some View {
        List(items, id: \.model) { item in
            VStack {
                ZStack{
                    GeometryReader { geo in
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 100) {
                                ForEach(item.images, id: \.self) { imageUrl in
                                    URLImage(URL(string: imageUrl)!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geo.size.width - 40, height: 300)
                                            .cornerRadius(30)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .gesture(DragGesture()
                                .onEnded { value in
                                    let offset = value.translation.width
                                    let threshold = geo.size.width / 3.0
                                    
                                    if offset > threshold {
                                        currentIndex = max(currentIndex - 1, 0)
                                    } else if offset < -threshold {
                                        currentIndex = min(currentIndex + 1, item.images.count - 1)
                                    }
                                }
                            )
                        }
                    }
                }
                Text(item.model)
                Text(item.content)
            }
            .frame(height: 550)
            }
        .onAppear(perform: delegateFunc)
    
    }
    
    func delegateFunc() {
        let model = GetJsonData()
        model.delegate = self
        model.loadData()
    }
    
//    func loadData() {
//        // Define the URL
//        guard let url = URL(string: "https://sunhyongkwon.github.io/data.json") else {
//            print("Invalid URL")
//            return
//        }
//
//        // Create a URL request
//        let request = URLRequest(url: url)
//
//        // Create a URL session
//        let session = URLSession.shared
//
//        // Create a data task
//        let task = session.dataTask(with: request) { data, response, error in
//            // Handle errors
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            // Ensure there is data
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//            
//            do {
//                // Decode the JSON data
//                let decodedData = try JSONDecoder().decode(Shoes.self,from: data)
//                
//                
//                // Use the decoded data to update your UI
//                DispatchQueue.main.async {
//                    // Update UI here
//                    self.items = decodedData.results
//                }
//            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
//            }
//        }
//
//        // Start the data task
//        task.resume()
//
//    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
