//
//  OctordleGuess.swift
//  OctordleMockUp
//
//  Created by Lasya Kambhampati on 7/25/23.
//

import SwiftUI

class OctordleGuess: ObservableObject {
    @Published var guessedWords: [Guess] = []
    
   
    //hold the guesses for octordle -> 13 options (hold the previously guessed words)
    @Published var index: Int = 0
//    @Published var keyColors = [String: Color] ()
    var guessNumber: Int = 0
    var currentGuess: String = ""
    var correctWords = [String]()
    
    @Published var octordleKeyboard = [[String:Color](),[String:Color](),[String:Color](),[String:Color](),[String:Color](),[String:Color](),[String:Color](),[String:Color]() ]
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0)}
    //if the game is over or not
    //what the correct word is for this octordle -> array of size 8
    //the letters that are correct
    //the letters that are in the wrong place
    //the current guess word
    //what current wordle we're on 
    
    init(){
        newGame()
    }
    
    func newGame(){
        for index in 0..<13{
            guessedWords.append(Guess(wordIndex: index))
        }
        for _ in 0..<8{
            correctWords.append(Data.possibleWords.randomElement()!)
        }
        for index in 0..<8{
            for character in letters{
                octordleKeyboard[index][String(character)] = .gray
            }
        }
        
        
        
    }
    
    func increaseIndex(){
        
        if index == 0{
            index = 7
        }
        else {
            index = index - 1
        }
        print("\(correctWords[self.index])")
    }
    
    func decreaseIndex(){
        
        if index == 7{
            index = 0
        }
        else {
            index = index + 1
        }
        print("\(correctWords[self.index])")
    }

    func addToWord(_ letter: String){
        //add letter to the end of the word when the keyboard is pressed
        currentGuess += letter
        let temp = currentGuess.padding(toLength: 5, withPad: " ", startingAt: 0)
        guessedWords[guessNumber].word = temp
        //update the Guess with the new word
        
    }
    
    func removeFromWord(){
        currentGuess.removeLast()
        let temp = currentGuess.padding(toLength: 5, withPad: " ", startingAt: 0)
        guessedWords[guessNumber].word = temp
        //update the Guess with the new word
        
    }
    func verifyWord() -> Bool{
        return UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentGuess)
    }
    
    func enterWord(){
        
        let currentGuessArray = currentGuess.map { String($0)}
        
        if verifyWord(){
            for screens in 0..<8 {
                let correctWord = correctWords[screens].map { String($0)}
                var correctLetters: [String] = []
    //            var misplacedLetters: [String] = []
                
                for letterIndex in 0..<5{
                    let currentGuessLetter = currentGuessArray[letterIndex]
                    let currentCorrectLetter = correctWord[letterIndex]
                    if currentCorrectLetter == currentGuessLetter{
                        octordleKeyboard[screens][currentGuessLetter] = .cyan
                        correctLetters.append(currentGuessLetter)
                        print("correct")
                    }
                    print("\(correctLetters)")
                    if correctWord.contains(currentGuessLetter) {
                        if !(correctLetters.contains(currentGuessLetter)){
                            print("entered loop correctly")
                            octordleKeyboard[screens][currentGuessLetter] = Color.yellow
                            print("misplaced")
                        }
                        
                    }
    //                else{
    //                    octordleKeyboard[index][currentGuessLetter] = Color.black
    //                    print("wrong")
    //                }
                    print("\(currentGuessLetter), \(currentCorrectLetter) \(octordleKeyboard[index][currentGuessLetter] ?? Color.red)")
                }
                print(" ")
            }
           
            
            
        }
        else {
            print("word not possible")
        }

    }
    

    
    
    
    

    
    
    
    
    
}
