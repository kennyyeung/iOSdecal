//
//  HangmanGame.swift
//  Hangman
//
//  Created by Kenny Yeung on 2/20/2018.
//  Worked & Collaborated with Jessie Nguyen.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanGame {
    var currentPhrase: String? //The current phrase of the game
    var currentPhraseArray = [Character]() //Array of characters
    var currentPhraseCheck = [Bool]() //Checks if it's a letter
    var goalLetters = Set<String>() //The goal letters
    var wrongGuesses = Set<String>() //The wrong guesses
    var wrongGuessDisplay: String? //Display of the wrong guesses
    var prevGuessed = Set<String>()
    
    init() {
        
        let phrase: String = HangmanPhrases().getRandomPhrase()
        currentPhrase = phrase
        currentPhraseArray = Array(phrase)
        currentPhraseCheck = [Bool]()
        goalLetters = Set<String>()
        wrongGuesses = Set<String>()
        wrongGuessDisplay = "Incorrect Guesses:"
        prevGuessed = Set<String>()
        
        for letter in currentPhrase! {
            //Player doesn't need to guess spaces
            if (letter == " ") {
                
                currentPhraseCheck.append(true)
                
            } else {
                currentPhraseCheck.append(false)
                goalLetters.insert(String(letter))
            }
        }
    }
    
    func winGame() -> Bool {
        for letter in currentPhraseCheck {
            //Checks if letter is not guessed
            if !letter {
                
                return false
                
            }
        }
        return true
    }
    
    func displayText() -> String {
        var text = ""
        var i = 0
        for letter in currentPhrase! {
            if (letter == " ") {
                
                text += "  "
                
            } else {
                if (currentPhraseCheck[i] == false) {
                    
                    text += "_ "
                    
                } else {
                    text += String(letter) + " "
                }
            }
            i += 1
        }
        return text
    }
    
    func updateDisplay(wrongLetter: String) {
        wrongGuessDisplay = wrongGuessDisplay! + " " + wrongLetter
    }
    
    func newGame() {
        
        let phrase: String = HangmanPhrases().getRandomPhrase()
        currentPhrase = phrase
        currentPhraseArray = Array(phrase)
        currentPhraseCheck = [Bool]()
        goalLetters = Set<String>()
        wrongGuesses = Set<String>()
        wrongGuessDisplay = "Wrong Guesses:"
        prevGuessed = Set<String>()
        
        for letter in phrase {
            //Player doesn't need to guess spaces
            if (letter == " ") {
                
                currentPhraseCheck.append(true)
                
            } else {
                currentPhraseCheck.append(false)
                goalLetters.insert(String(letter))
            }
        }
    }
}
