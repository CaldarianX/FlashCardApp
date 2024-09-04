//
//  ListCard.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import SwiftUI
import SwiftData

struct ListCard: View {
    @State var theDeck: DeckCard
    @State var Ondelete : Bool = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            HStack{
                Text("\(theDeck.cards.count) cards")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                Spacer()
            }
            .padding(.horizontal,22)
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(theDeck.cards.indices, id: \.self) { index in
                        showCard(deck: $theDeck, index: index, Ondelete: $Ondelete)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMultipleCard(Deck: $theDeck)){
                            Image(systemName: "list.bullet.rectangle.portrait")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PlayFlashCard(Decks: $theDeck)){
                            Image(systemName: "play.fill")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation{
                            Ondelete.toggle()
                        }
                    }){
                        Image(systemName: "x.circle")
                            .bold()
                            .foregroundStyle(Ondelete ? .red : .gray)
                    }
                }
            }
        }
    }
}

struct showCard: View {
    @Binding var deck : DeckCard
    var index : Int
    @Binding var Ondelete : Bool
    var body: some View {
        VStack {
            if(Ondelete){
                VStack(alignment : .leading){
                    Button(action : {
                        _ = withAnimation{
                            deck.cards.remove(at: index)
                        }
                    }){
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.red)
                            .bold()
                    }
                }
            }
            Text("\(deck.cards[index].Question)")
                .lineLimit(1)
                .font(.title3)
                .foregroundStyle(.black)
            Text("\(deck.cards[index].Answer)")
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
