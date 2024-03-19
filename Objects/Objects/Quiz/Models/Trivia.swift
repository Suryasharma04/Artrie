//
//  Trivia.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import Foundation

struct Trivia: Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting the formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answer: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map {answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswer = correct + incorrects
                return allAnswer.shuffled()
                
            } catch {
                print("Error setting the answers: \(error)")
                return []
            }
        }
    }
}
