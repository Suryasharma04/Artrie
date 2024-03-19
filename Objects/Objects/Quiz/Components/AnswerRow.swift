//
//  AnswerRow.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.system(size: 10))
                .foregroundColor(Color("colorThree"))
            
            Text(answer.text)
                .bold()
                .font(.system(size: 15))
                .foregroundColor(Color("colorThree"))
            
            
            if isSelected{
                Spacer()
                
                if !answer.isCorrect{
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(Color("colorTwo"))
                    
                }
                
                else{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("colorSix"))
       }
                               
//
//                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                    .foregroundColor(answer.isCorrect ? Color("colorSix") : Color("colorTwo"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("colorThree") : .gray) : Color("colorThree"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? Color("colorSix") : Color("colorTwo")) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
//            isSelected = true
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text:"Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
