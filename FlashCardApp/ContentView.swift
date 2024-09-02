//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Raphael on 31/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var Decks : [DeckCard] = [
        DeckCard(name: "Bio", type: .Bio),
        DeckCard(name: "I want to sleep", type: .Bio),
        DeckCard(name: "Chem", type: .Chem),
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    SubjectHeader(sub: .Bio, heading: "Biology")
                    ForEach(GetFilter(Decks, of: .Bio),id: \.name){Deck in
                        DeckHeading(heading: Deck.name)
                    }
                    SubjectHeader(sub: .Chem, heading: "Chemistry")
                    ForEach(GetFilter(Decks, of: .Chem),id: \.name){Deck in
                        DeckHeading(heading: Deck.name)
                    }
                    SubjectHeader(sub: .Math, heading: "Math")
                    ForEach(GetFilter(Decks, of: .Math),id: \.name){Deck in
                        DeckHeading(heading: Deck.name)
                    }
                    SubjectHeader(sub: .Physic, heading: "Physic")
                    ForEach(GetFilter(Decks, of: .Physic),id: \.name){Deck in
                        DeckHeading(heading: Deck.name)
                    }
                    Spacer()
                    
                }
            }
            .navigationTitle("Decks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AddNewDecks(of: &Decks)
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .padding()
    }
}

struct SubjectHeader : View {
    var sub : Subject
    var heading : String
    var body: some View {
        Text("\(heading)")
            .font(.title2)
            .fontWeight(.bold)
            .padding(5)
            .frame(maxWidth: .infinity)
            .foregroundStyle(GetSubjectColor(of: sub))
            .background(GetSubjectColor(of: sub).opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal,10)
    }
}
struct DeckHeading : View {
    var heading : String
    var body: some View {
        Text("\(heading)")
            .font(.title2)
            .fontWeight(.bold)
            .padding(5)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal,10)
    }
}
func GetFilter(_ decks : [DeckCard] ,of sub : Subject)->[DeckCard]{
    let newDecks = decks.filter{deck in
        if deck.type == sub{
            return true
        }
        else{
            return false
        }
    }
    return newDecks
}
func GetSubjectColor(of sub:Subject)->Color{
    switch sub {
    case .Bio:
        return .green
    case .Chem:
        return .blue
    case .Math:
        return .yellow
    case .Physic:
        return .red
    }
}
func AddNewDecks(of Decks : inout [DeckCard]){
    Decks.append(DeckCard(name: "Explonential & Log", type: .Math))
}
#Preview {
    ContentView()
}
