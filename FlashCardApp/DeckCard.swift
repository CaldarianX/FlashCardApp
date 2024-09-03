//
//  DeckCard.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import Foundation


enum Subject{
    case Bio,Math,Physic,Chem,Japanese
}

struct DeckCard : Identifiable{
    var id = UUID()
    var name : String
    var cards : [Card] = []
    var size : Int = 0
    var type : Subject
    
    init(name: String,type: Subject) {
        self.name = name
        self.type = type
    }
    
    mutating func addCard(Question : String,Answer : String,Explaination:String){
        let newcard = Card(Q: Question, Ans: Answer, Exp: Explaination)
        cards.append(newcard)
        size += 1
        print("WTF \(size)")
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
