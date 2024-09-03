//
//  NewDeck.swift
//  FlashCardApp
//
//  Created by Raphael on 3/9/24.
//

import SwiftUI

struct NewDeck: View {
    @Environment(\.dismiss) var dismiss
    @State var name : String =  " "
    @State var selectedSubject : Subject = .Bio
    @Binding var Decks : [DeckCard]
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                TextField("", text: $name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                HStack{
                    Text("Select Subject")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Seclect Subject",selection: $selectedSubject){
                        Text("Biology").tag(Subject.Bio)
                        Text("Mathematics").tag(Subject.Math)
                        Text("Physics").tag(Subject.Physic)
                        Text("Chemistry").tag(Subject.Chem)
                    }
                    .foregroundStyle(.black)
                }
                Button(action: {
                    if(name != ""){
                        Decks.append(DeckCard(name: name, type: selectedSubject))
                    }
                    name = ""
                    dismiss()
                }, label: {
                    Text("Done")
                        .font(.headline)
                        .fontWeight(.bold)
                })
                .frame(maxWidth:.infinity)
                .padding(.horizontal,20)
                .padding(.vertical,5)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
            .padding()
//            .toolbar{
//                ToolbarItem(placement : .topBarTrailing){
//                    Button(action: {
//                        if(name != ""){
//                            Decks.append(DeckCard(name: name, type: selectedSubject))
//                        }
//                    }, label: {
//                        Text("Done")
//                            .font(.headline)
//                            .fontWeight(.medium)
//                            .foregroundStyle(.blue)
//                        
//                    })
//                    
//                }
//                ToolbarItem(placement :.topBarLeading){
//                    Button(action: {
//                        dismiss()
//                    }, label: {
//                        Text("Cancle")
//                            .font(.headline)
//                            .fontWeight(.medium)
//                            .foregroundStyle(.blue)
//                    })
//                }
//            }
        }
    }
}


//#Preview {
////    NewDeck(Decks: [DeckCard(name: "Hello", type: .Bio)])
////    NewDeck(, Decks: Binding<[DeckCard]>)
//}
