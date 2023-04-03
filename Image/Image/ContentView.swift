//
//  ContentView.swift
//  Image
//
//  Created by 김한별 on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Step 1: SF Symbols
//        Image(systemName: "cloud.heavyrain")
//            .font(.system(size: 100))
//            .foregroundColor(.blue)
//            .shadow(color: .gray, radius: 10, y: 15)
        // Step 2: 일반 이미지
//        Image("paris")
//            .resizable() // safeArea에 맞춰짐
//            .edgesIgnoringSafeArea(.all)
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 300)
//            .clipped()
        // Step 3: 일반 이미지 Filltering
//        Image("paris")
//            .resizable() // safeArea에 맞춰짐
//            .edgesIgnoringSafeArea(.all)
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 300)
//            .clipped()
//            .clipShape(Capsule())
//            .opacity(0.5) // 투명도
        // Step 4: Overay with SF Symbols
//        Image("paris")
//            .resizable() // safeArea에 맞춰짐
//            .edgesIgnoringSafeArea(.all)
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 300)
//            .clipped()
//            .clipShape(Circle())
//            .opacity(0.5) // 투명도
//            .overlay(
//                Image(systemName: "heart.fill")
//                    .font(.system(size: 50))
//                    .foregroundColor(.pink)
//                    .opacity(0.5)
//            )
        // Step 5: Overlay with Text
//        Image("paris")
//            .resizable() // safeArea에 맞춰짐
//            .aspectRatio(contentMode: .fit)
//            .overlay(
//                Text(
//                    "If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveab le feast.\n\n- Ernest Hemingway"
//                    )
//                    .fontWeight(.bold)
//                    .font(.system(.headline, design: .rounded))
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.black)
//                    .cornerRadius(10)
//                    .opacity(0.7)
//                    .padding()
//                ,
//                alignment: .top
        Image("paris")
            .resizable() // safeArea에 맞춰짐
            .aspectRatio(contentMode: .fit)
            .overlay(
                Rectangle()
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    )
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
