//
//  ContentView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dm: OctordleGuess
    var body: some View {
        ZStack {
            NavigationView {
                HStack{
                    Button {
                        dm.increaseIndex()
                        
                    } label: {
                        Image(systemName: "triangle.fill")
                            .rotationEffect(Angle(degrees: 270))
                            .foregroundColor(.cyan)
                    }
                    .offset(y:-60)
                    
                    VStack{
                        WordleView(index: 0)
                            .offset(y: -20)
                        KeyboardView()
                        //Text("\(dm.currentGuess)")
                    }
                   
                    
                    Button {
                        dm.decreaseIndex()
                        
                    } label: {
                        Image(systemName: "triangle.fill")
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.cyan)
                    }
                    .offset(y:-60)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                             
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.cyan)
                        }

                    }
                    ToolbarItem(placement: .principal) {
                        Button {
                             
                        } label: {
                            Text("OCTORDLE")
                                .font(.headline)
                                .foregroundColor(.cyan)
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                             
                        } label: {
                            Image(systemName: "chart.bar")
                                .foregroundColor(.cyan)
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                             
                        } label: {
                            Image(systemName: "gear.circle")
                                .foregroundColor(.cyan)
                        }

                    }

                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(OctordleGuess())
    }
}
