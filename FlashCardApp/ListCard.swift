//
//  ListCard.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import SwiftUI

struct ListCard: View {
    @Binding var theDeck: DeckCard
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(theDeck.cards, id: \.id) { card in
                        showCard(Question: card.Question, Answer: card.Answer)
                    }
                }
            }
            .navigationTitle("\(theDeck.name)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ManageDeck(Deck: $theDeck)){
                            Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct showCard: View {
    var Question: String
    var Answer: String
    
    var body: some View {
        VStack {
            Text("\(Question)")
                .lineLimit(1)
                .font(.title3)
                .foregroundStyle(.black)
            Text("\(Answer)")
                .lineLimit(1)
                .font(.caption)
                .foregroundStyle(.black)
        }
        .frame(width: 150)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
        .padding(.vertical,5)
    }
}

#Preview {
    ListCard(theDeck: .constant(DeckCard(name: "Biology", type: .Bio)))
}



//#Preview {
//    ListCard(theDeck: DeckCard(name: "Biology", type: .Bio))
//}
