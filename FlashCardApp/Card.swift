import Foundation
import SwiftData


class Card : Identifiable{
    var id = UUID()
    var Question : String
    var Answer : String
    var Explaination : String? = ""
    init(Q Question: String,Ans Answer: String,Exp Explaination : String) {
        self.Question = Question
        self.Answer = Answer
        self.Explaination = Explaination
    }
}
