//
//  GuessView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/26/23.
//

import SwiftUI

struct GuessView: View {
    @EnvironmentObject var dm: OctordleGuess
    var rowNumber: Int
    
    var body: some View {
        HStack{
            ForEach(0...4, id: \.self){character in
                if dm.isEntered[dm.guessNumber] {

                    Text("\(dm.guessedWords[rowNumber].guessLetters[character])")
                        .font(.system(size: 12))
                        .frame(width: 35,height: 15)
                        .padding(.horizontal,10)
                        .padding(.vertical,10)
                        .foregroundColor(.black.opacity(1.0))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.cyan, lineWidth: 1)
                                .background(RoundedRectangle(cornerRadius: 10).fill(dm.guessedWords[rowNumber].backgroundColors[dm.index][character]).opacity(0.3))
                        )
                }
                else{
                    
                    Button {
                        //when the button is pressed the letter should be added to the end of the word
//                        dm.addToWord(letter)
                    } label: {
                        Text("\(dm.guessedWords[rowNumber].guessLetters[character])")
                            .font(.system(size: 12))
                            .frame(width: 35,height: 15)
                            .padding(.horizontal,10)
                            .padding(.vertical,10)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(0.1))
                            )
                        
                    }
                    .disabled(true)
                    //do not want this to be clickable -> but i think it helps the formatting
                }
                
                
            }
        }
        
        
        
        
        
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(rowNumber: 0)
            .environmentObject(OctordleGuess())
    }
}


//scrapped formatting
// .foregroundColor(.black)
//                    .font(.system(size: 12))
//                    .frame(width: 35,height: 15)
//                    .padding(.horizontal,10)
//                    .padding(.vertical,10)
//                   .background(RoundedRectangle(cornerRadius: 10).stroke(dm.guessedWords[dm.index].backgroundColors[character]))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 1)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(dm.guessedWords[dm.index].backgroundColors[character]).opacity(0.5))
