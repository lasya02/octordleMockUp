//
//  ContentView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    var body: some View {
        ZStack {
            NavigationView {
                HStack{
                    Image(systemName: "plus.circle")
                    Spacer()
                    Text("Octordle")
                        .frame(alignment: .center)
                        .font(.system(size: 30))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
    
                    Spacer()
                    Image(systemName: "chart.bar")
                    Image(systemName: "gear.circle")
                }
                .offset(y: -320)
            }
            .padding()
            
            HStack{
                Button {
                    if index == 0{
                        index = 7
                    }
                    else {
                        index = index - 1
                    }
                    
                } label: {
                    Image(systemName: "triangle.fill")
                        .rotationEffect(Angle(degrees: 270))
                }
                
                WordleView(index: index)
                
                Button {
                    if index == 7{
                        index = 0
                    }
                    else {
                        index = index + 1
                    }
                    
                } label: {
                    Image(systemName: "triangle.fill")
                        .rotationEffect(Angle(degrees: 90))
                }

            }
            
//            ForEach (0..<8) {index in
//               WordleView(index: index)
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
