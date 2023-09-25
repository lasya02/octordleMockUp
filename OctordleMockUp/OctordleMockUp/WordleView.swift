//
//  WordleView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct WordleView: View {
    @EnvironmentObject var dm: OctordleGuess
    
    var index: Int
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach (0..<8){index4 in
                    if dm.guessedCorrectly[index4] {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.green)
                        .frame(width: 30, height: 20)
                    }
                    else if index4 == dm.index{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.cyan)
                        .frame(width: 30, height: 20)
                    }
                    else{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.gray)
                        .frame(width: 30, height: 20)
                           
                    }
              
                }
            }
            //will indicate what screen the user is on and when one of the individual wordles has been completed 
            
            
            ForEach (0..<13){index4 in
                HStack(spacing: 2) {
                    GuessView( rowNumber: index4)
                    
                }
            }
        }
        
    }
}

struct WordleView_Previews: PreviewProvider {
    static var previews: some View {
        WordleView(index: 1)
            .environmentObject(OctordleGuess())
    }
}
