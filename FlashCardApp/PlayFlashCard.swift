//
//  PlayFlashCard.swift
//  FlashCardApp
//
//  Created by Raphael on 3/9/24.
//

import SwiftUI

struct PlayFlashCard: View {
    @Environment(\.dismiss) var dismiss
    @State var atQuestion: Int = 0
    @State var showAnswer: Bool = false
    @State var rotation: Double = 0
    @Binding var Decks: DeckCard
    
    var body: some View {
        VStack {
            Gauge(value: Double(atQuestion + 1), in: 0...Double(Decks.cards.count)) {
                Text("\(String(atQuestion + 1))")
            }
            Spacer()
            Text(showAnswer ? "Answer" : "Question")
                .font(.title3)
                .fontWeight(.bold)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.6)) {
                    rotation += 180
                }
                
                if !showAnswer {
                    showAnswer = true
                } else if atQuestion >= Decks.cards.count - 1 {
                    dismiss()
                } else if showAnswer {
                    atQuestion += 1
                    showAnswer = false
                }
            }) {
                VStack {
                    if showAnswer {
                        Text(Decks.cards[atQuestion].Answer)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))  // Mirror text when flipping
                        if let explanation = Decks.cards[atQuestion].Explaination, !explanation.isEmpty {
                            Text(explanation)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        }
                    } else {
                        Text(Decks.cards[atQuestion].Question)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(.thinMaterial)
                .padding(.horizontal, 20)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
