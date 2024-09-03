//
//  PlayFlashCard.swift
//  FlashCardApp
//
//  Created by Raphael on 3/9/24.
//

import SwiftUI

struct PlayFlashCard: View {
    @Environment (\.dismiss) var dismiss
    @State var atQuestion : Int = 0
    @State var ShowAnswer : Bool = false
    @Binding var Decks : DeckCard
    var body: some View {
        VStack{
            Gauge(value: Double(atQuestion+1), in : 0...Double(Decks.cards.count)) {
                Text("\(String(atQuestion+1))")
            }
            Spacer()
            Button(action: {
                if(!ShowAnswer){
                    ShowAnswer = true
                }
                else if(atQuestion >= Decks.cards.count-1){
                    dismiss()
                }
                else if(ShowAnswer){
                    atQuestion += 1
                    ShowAnswer = false
                }
            }, label: {
                if(ShowAnswer){
                    VStack{
                        Text(Decks.cards[atQuestion].Answer)
                            .font(.title)
                            .foregroundStyle(.black)
                        if(Decks.cards[atQuestion].Explaination != ""){
                            Text(Decks.cards[atQuestion].Explaination!)
                                .font(.title3)
                                .foregroundStyle(.black)
                        }
                    }
                }
                else{
                    Text(Decks.cards[atQuestion].Question)
                        .font(.title)
                        .foregroundStyle(.black)
                }
            })
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(.thinMaterial)
            .shadow(radius: 5)
            .padding(.horizontal,20)
            Spacer()
        }
        .padding(.horizontal,20)
    }
}
//#Preview {
//    @State var newDeck = DeckCard(name: "Biology", type: .Bio)
//    
//    // Adding cards to the deck
//    newDeck.addCard(Question: "AWD", Answer: "ADW", Explaination: "ADW")
//    newDeck.addCard(Question: "AWDwda", Answer: "ADawdawW", Explaination: "ADWawdaw")
//    newDeck.addCard(Question: "AWDawdad", Answer: "ADadwawW", Explaination: "")
//
//    return PlayFlashCard(Decks: $newDeck)
//}
