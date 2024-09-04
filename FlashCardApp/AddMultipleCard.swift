//
//  AddMultipleCard.swift
//  FlashCardApp
//
//  Created by Raphael on 3/9/24.
//

import SwiftUI

struct AddMultipleCard: View {
    @Environment (\.dismiss) var dismiss
    @State var userInput : String = ""
    @Binding var Deck : DeckCard
    var body: some View {
        VStack{
            Text("Add Multiple Card")
                .font(.title)
                .fontWeight(.bold)
            TextEditor(text: $userInput)
            //                .frame(maxWidth: .infinity)
                .frame(maxWidth: .infinity,maxHeight:300)
                .lineLimit(3)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
                .padding(.vertical,20)
            Button(action: {
                GetCard(userInput: userInput, Deck: &Deck)
                dismiss()
            }, label: {
                Text("Done")
                    .font(.title2)
                    .bold()
            })
            .padding(.vertical,10)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        Spacer()
    }
}

func GetCard(userInput : String,Deck : inout DeckCard){
//    print("HELLO")
//    print(userInput)
    let lines = userInput.components(separatedBy: "\n")
    for line in lines{
        let words = line.components(separatedBy: " ")
        if(words.count < 2){
            print("WTF IS HAPPENING")
            continue
        }
        print(words)
        let question = words[0]
        let answer = words[1]
        var explaination = " "
        if(words.count == 3){
            explaination = words[2]
        }
        print("Question = \(question), Answer = \(answer),explaination = \(explaination)")
        Deck.addCard(Question: question, Answer: answer, Explaination: explaination)
    }
}
//#Preview {
//    AddMultipleCard()
//}
