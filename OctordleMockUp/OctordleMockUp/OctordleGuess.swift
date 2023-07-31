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
    var guessNumber: Int = 0
    var currentGuess: String = ""
    var correctWords = [String]()
    var guessedCorrectly = [Bool]()
    @Published var isEntered = [Bool]()
    
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
                octordleKeyboard[index][String(character)] = .clear
            }
            guessedCorrectly.append(false)
            isEntered.append(false)
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
                var misplacedLetters: [String] = []
                
                if currentGuessArray == correctWord{
                    guessedCorrectly[screens] = true
                }
                
                for letterIndex in 0..<5{
                    let currentGuessLetter = currentGuessArray[letterIndex]
                    let currentCorrectLetter = correctWord[letterIndex]
                    if currentCorrectLetter == currentGuessLetter{
                        octordleKeyboard[screens][currentGuessLetter] = .cyan
                        correctLetters.append(currentGuessLetter)
                        guessedWords[guessNumber].backgroundColors[screens][letterIndex] = Color.cyan
                        print("correct")
                        
                    }
                    print("\(correctLetters)")
                    if correctWord.contains(currentGuessLetter) {
                        if !(correctLetters.contains(currentGuessLetter)){
                            //print("entered loop correctly")
                            octordleKeyboard[screens][currentGuessLetter] = Color.yellow
                            misplacedLetters.append(currentGuessLetter)
                            guessedWords[guessNumber].backgroundColors[screens][letterIndex] = .yellow
                            print("misplaced")
                        }
                        
                    }
                }
                //check to see if the letters are correct or misplaced
                
                for letters in currentGuessArray{
                    if !(misplacedLetters.contains(letters)) && !(correctLetters.contains(letters)){
                        octordleKeyboard[screens][letters] = Color.gray
                    }
                }
                //if the letters are not correct or misplaced, they are wrong need to be removed
       
            }
            //check the guess against all 8 correct words
            
            
            isEntered[guessNumber] = true
            //make sure that the letters colors correspond to the keyboard colors

            guessNumber = guessNumber + 1
            //increase the guess number
            currentGuess = ""
            //reset the current guess
        
        }
        else {
            print("word not possible")
        }

    }
    

    
    
    
    

    
    
    
    
    
}
