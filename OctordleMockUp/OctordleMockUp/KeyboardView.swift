//
//  KeyboardView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/26/23.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var dm: OctordleGuess

    var string1 = "QWERTYUIOP".map{String($0)}
    var string2 = "ASDFGHJKL".map{String($0)}
    var string3 = "ZXCVBNM".map{String($0)}
    //the map makes the string into an array that allows the for each loop to iterate over each of the characters

    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 2){
                ForEach(string1, id: \.self){index1 in
                    LetterView(letter: index1)
                    
                }
                //iterate over each of the characters in the string using the id of self
            }
            HStack(alignment: .center, spacing: 2){
                ForEach(string2, id: \.self){index2 in
                    LetterView(letter: index2)
                    
                }
            }
            HStack(alignment: .center, spacing: 2){
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                        .frame(width: 26,height: 10)
                        .padding(.horizontal,10)
                        .padding(.vertical,10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemCyan)))
                }
                .disabled(dm.currentGuess.count != 5)
                //enter button
               
                ForEach(string3, id: \.self){index3 in
                    LetterView(letter: index3)
                    
                }
                
                Button {
                    dm.removeFromWord()
                } label: {
                    Image(systemName: "delete.backward")
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                        .frame(width: 26,height: 10)
                        .padding(.horizontal,10)
                        .padding(.vertical,10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemCyan)))
                }
                .disabled(dm.currentGuess.isEmpty)
                //delete button

                
            }
            
            
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .environmentObject(OctordleGuess())
    }
}
