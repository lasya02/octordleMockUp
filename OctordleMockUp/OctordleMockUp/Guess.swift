//
//  Guess.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

struct Guess {
    let wordIndex: Int
    var word = "     "
    var guessLetters: [String] {
        word.map { String($0) }
    }
}
