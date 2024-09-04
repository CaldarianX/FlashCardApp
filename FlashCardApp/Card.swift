import Foundation
import SwiftData

@Model
class Card : Identifiable{
    @Attribute(.unique) var id = UUID()
    var Question : String
    var Answer : String
    var Explaination : String? = ""
    @Relationship var deck: DeckCard?
    
    init(Q Question: String,Ans Answer: String,Exp Explaination : String) {
        self.Question = Question
        self.Answer = Answer
        self.Explaination = Explaination
    }
}
