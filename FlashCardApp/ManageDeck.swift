//
//  ManageDeck.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import SwiftUI

struct ManageDeck: View {
    @State private var ques: String = ""
    @State private var ans: String = ""
    @State private var explain: String = ""
    @Binding var Deck : DeckCard
    var body: some View {
        VStack(alignment : .leading ,spacing: 10) {  // Add spacing between the TextEditors
            Text("Question")
            TextEditor(text: $ques)
//                .frame(maxWidth: .infinity)
                .frame(maxWidth: .infinity,maxHeight:100)
                .lineLimit(3)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            Text("Answer")
            TextEditor(text: $ans)
//                .frame(maxWidth: .infinity)
                .frame(maxWidth: .infinity,maxHeight:100)
                .lineLimit(3)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))

            Text("Explaination (Optional)")
            TextEditor(text: $explain)
                .lineLimit(3)
                .frame(maxWidth: .infinity,maxHeight:100)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            Spacer()
            HStack{
                Button(action: {
                    if(ques != "" && ans != ""){
                        Deck.addCard(Question: ques, Answer: ans, Explaination: explain)
                        ques = ""
                        ans = ""
                        explain = ""
                    }
                }, label: {
                    Text("Add")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical,5)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
//                Button(action
            }
            .frame(height: 20)
            .padding(.horizontal,10)
        }
        .padding()
//        .ignoresSafeArea(.container)
    }
}

//#Preview {
//    ManageDeck()
//}

