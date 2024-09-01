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
    
    var body: some View {
        VStack(alignment : .leading ,spacing: 10) {  // Add spacing between the TextEditors
            Text("Question")
            TextEditor(text: $ques)
//                .frame(maxWidth: .infinity)
                .lineLimit(3)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            Text("Answer")
            TextEditor(text: $ans)
//                .frame(maxWidth: .infinity)
                .lineLimit(3)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))

            Text("Explaination (Optional)")
            TextEditor(text: $explain)
                .frame(maxWidth: .infinity)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            Spacer()
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: {
                    
                }, label: {
                    Text("Done")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
//                Button(action
            }
            .frame(height: 50)
        }
        .padding()
    }
}

#Preview {
    ManageDeck()
}
