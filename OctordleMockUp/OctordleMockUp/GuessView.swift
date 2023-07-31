//
//  GuessView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/26/23.
//

import SwiftUI

struct GuessView: View {
    @EnvironmentObject var dm: OctordleGuess
    var integer: Int
    
    var body: some View {
        HStack{
            ForEach(0...4, id: \.self){character in
                Text("\(dm.guessedWords[integer].guessLetters[character])")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .frame(width: 35,height: 15)
                    .padding(.horizontal,10)
                    .padding(.vertical,10)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemCyan)))
                
            }
        }
        
        
        
        
        
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(integer: 0)
            .environmentObject(OctordleGuess())
    }
}
