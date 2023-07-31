//
//  LetterView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct LetterView: View {
    @EnvironmentObject var dm: OctordleGuess
    var letter: String
    var body: some View {
        Button {
            //when the button is pressed the letter should be added to the end of the word
            dm.addToWord(letter)
        } label: {
            Text("\(letter)")
                .foregroundColor(.black)
                .font(.system(size: 12))
                .frame(width: 10,height: 10)
                .padding(.horizontal,10)
                .padding(.vertical,10)
                .background(RoundedRectangle(cornerRadius: 10).fill(dm.octordleKeyboard[dm.index][letter]!))
                
                
        }

    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView(letter: "W")
            .environmentObject(OctordleGuess())
    }
}
