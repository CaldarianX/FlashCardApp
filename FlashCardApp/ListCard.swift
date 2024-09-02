//
//  ListCard.swift
//  FlashCardApp
//
//  Created by Raphael on 1/9/24.
//

import SwiftUI

struct ListCard: View {
    @State private var moreCard: Bool = false
    @Binding var onadd : Bool
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Add More", value: "ManageDeck")
                    .padding()
            }
            .navigationDestination(for: String.self) { value in
                if value == "ManageDeck" {
                    ManageDeck()
                }
            }
            .navigationTitle("List of Cards")
        }
    }
}



//#Preview {
//    ListCard()
//}
