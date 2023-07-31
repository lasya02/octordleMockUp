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
            Text("\(dm.index)")
                ForEach (0..<13){index4 in
                    HStack(spacing: 2) {
                        GuessView(integer: index4)
                       
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
