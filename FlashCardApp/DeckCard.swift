//
//  DeckCard.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import Foundation


enum Subject{
    case Bio,Math,Physic,Chem
}

struct DeckCard{
    var cards : [Card] = []
    var size : Int = 0
    
    mutating func addCard(Question : String,Answer : String,Explaination:String){
        let newcard = Card(Q: Question, Ans: Answer, Exp: Explaination)
        cards.append(newcard)
        size += 1
    }
    
    func getQuestion(index : Int) ->String{
        if(index < size){
            return cards[index].Question
        }
        else{
            return "OutOfRange"
        }
    }
    
    func getAnswer(index : Int) ->String{
        if(index < size){
            return cards[index].Answer
        }
        else{
            return "OutOfRange"
        }
    }
    
    func getExplaination(index : Int) ->String{
        if(index < size){
            return cards[index].Explaination!
        }
        else{
            return "OutOfRange"
        }
    }
}
