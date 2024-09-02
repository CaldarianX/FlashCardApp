//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Raphael on 31/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var x = ["hi","lol","adwd"]
    @State var onadd = false
    var body: some View {
        NavigationSplitView(){
            List{
                ForEach(x,id: \.self){i in
                    Text(i)
                }
            }
            .navigationTitle("Deck")
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                    },label: {
                        Image(systemName: "plus")
                    })
                }
            }
//            
            .navigationSplitViewStyle(.balanced)

        }
        detail: {
            ListCard(onadd: $onadd)
        }
    }
}

#Preview {
    ContentView()
}
