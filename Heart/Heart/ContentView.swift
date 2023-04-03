//
//  ContentView.swift
//  Heart
//
//  Created by 김한별 on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    
    // 런타임 후 State 상태 변환
    @State var colorChange = false
    @State var sizeChange = false
    
    var body: some View {
        // VStack = Column
        // HStack = Row
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 200))
                .foregroundColor(colorChange ? .yellow : .red)
                .scaleEffect(sizeChange ? 1.5 : 1)
                .animation(.easeInOut(duration: 0.5), value: sizeChange)
                .onTapGesture {
                    colorChange.toggle()
                }
                .onLongPressGesture {
                    sizeChange.toggle()
                }
            Text("Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .padding()
                .rotation3DEffect(.degrees(60), axis: (x:1, y: 0, z: 0))
                .shadow(color: .gray, radius: 2, y: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
