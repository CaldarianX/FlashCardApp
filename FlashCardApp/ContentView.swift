//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Raphael on 31/8/24.
//
import SwiftUI

struct ContentView: View {
    @State var Decks: [DeckCard] = [
        DeckCard(name: "Bio", type: .Bio),
        DeckCard(name: "I want to sleep", type: .Bio),
        DeckCard(name: "Chem", type: .Chem),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    SubjectHeader(sub: .Bio, heading: "Biology")
                    if(filteredDecks(of: .Bio).count > 0){
                        ForEach(filteredDecks(of: .Bio), id: \.id) { deck in
                            NavigationLink(destination: ListCard(theDeck: binding(for: deck))) {
                                DeckHeading(heading: deck.name)
                            }
                        }
                    }
                    if(filteredDecks(of: .Physic).count > 0){
                        SubjectHeader(sub: .Chem, heading: "Chemistry")
                        ForEach(filteredDecks(of: .Chem), id: \.id) { deck in
                            NavigationLink(destination: ListCard(theDeck: binding(for: deck))) {
                                DeckHeading(heading: deck.name)
                            }
                        }
                    }
                    if(filteredDecks(of: .Math).count > 0){
                        SubjectHeader(sub: .Math, heading: "Math")
                        ForEach(filteredDecks(of: .Math), id: \.id) { deck in
                            NavigationLink(destination: ListCard(theDeck: binding(for: deck))) {
                                DeckHeading(heading: deck.name)
                            }
                        }
                    }
                    if(filteredDecks(of: .Physic).count > 0){
                        SubjectHeader(sub: .Physic, heading: "Physics")
                        ForEach(filteredDecks(of: .Physic), id: \.id) { deck in
                            NavigationLink(destination: ListCard(theDeck: binding(for: deck))) {
                                DeckHeading(heading: deck.name)
                            }
                        }
                    }
                    if(filteredDecks(of: .Japanese).count > 0){
                        SubjectHeader(sub: .Japanese, heading: "Japanese")
                        ForEach(filteredDecks(of: .Japanese), id: \.id) { deck in
                            NavigationLink(destination: ListCard(theDeck: binding(for: deck))) {
                                DeckHeading(heading: deck.name)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Decks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NewDeck(Decks: $Decks)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .padding()
    }
    
    // Filtering Decks based on Subject
    private func filteredDecks(of subject: Subject) -> [DeckCard] {
        return Decks.filter { $0.type == subject }
    }
    
    // Finding the binding for a specific DeckCard
    private func binding(for deck: DeckCard) -> Binding<DeckCard> {
        guard let index = Decks.firstIndex(where: { $0.id == deck.id }) else {
            fatalError("Deck not found")
        }
        return $Decks[index]
    }
}

#Preview {
    ContentView()
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
    case .Japanese:
        return .pink
    }
}
func GetSubjectTitle(of sub:Subject)->String{
    switch sub {
    case .Bio:
        return "Biology"
    case .Chem:
        return "Chemistry"
    case .Math:
        return "Math"
    case .Physic:
        return "Physic"
    case .Japanese:
        return "Japanese"
    }
}
func AddNewDecks(of Decks : inout [DeckCard]){
    Decks.append(DeckCard(name: "Explonential & Log", type: .Math))
}
#Preview {
    ContentView()
}
