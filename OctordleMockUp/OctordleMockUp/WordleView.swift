//
//  WordleView.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct WordleView: View {
    var index: Int
    var body: some View {
        VStack(alignment: .center) {
            
                Text("\(index)")
                ForEach (0..<13){index in
                    HStack {
                        ForEach(0..<5) {index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.mint)
                                .frame(width: 52,height: 27)
                        
                        }
                    }
                }
                .offset(y: -30)
                .frame(alignment: .center)
        
            
        }
        
    }
}

struct WordleView_Previews: PreviewProvider {
    static var previews: some View {
        WordleView(index: 1)
    }
}
