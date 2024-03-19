//
//  QuestionView.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        ZStack{
            //BackgroundQuestion()
            VStack(spacing: 30){
                HStack{
                    Text("Quiz Game")
                        .MainTitle()
                    
                    Spacer()
                    
                    Text("\(triviaManager.index+1) out of \(triviaManager.length)")
                        .foregroundColor(Color.gray)
                        .fontWeight(.heavy)
                }
                
                ProgressBar(progress: triviaManager.progress)
                
                VStack(alignment: .leading, spacing: 20){
                    Text(triviaManager.question)
                        .font(.system(size:20))
                        .bold()
                    // .foregroundColor(.black)
                        .foregroundColor(Color("grayColor"))
                    
                    //this is for wrapping text:
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Spacer()
                    
                    ForEach(triviaManager.answerChoices, id : \.id) {answer in AnswerRow(answer: answer)
                            .environmentObject(triviaManager)
                    }
                    
                }
                // Spacer()
                Button {
                    triviaManager.goToNextQuestion()
                } label: {
                    PrimaryButton(text: "Next", background: triviaManager.answerSelected ? .gray : Color("mauve"))
                }
                
                .disabled(!triviaManager.answerSelected)
                
                Spacer()
                
            }
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarHidden(true)
            // .background(Color.white)
            .background(Image("ImageThree")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}

struct BackgroundQuestion: View{
    var body: some View{
        
        Rectangle()
            .foregroundColor(Color("colorOne"))
            .frame(width:100, height: 600)
            .rotationEffect(.degrees(120))
            .offset(x:0, y: 0)
            .opacity(0.3)
        
        Rectangle()
            .foregroundColor(Color("colorThree"))
            .frame(width:100, height: 800)
            .rotationEffect(.degrees(150))
            .offset(x:-70, y:0)
            .opacity(0.3)
        
        
    }
}
