//
//  TriviaView.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        
        if triviaManager.reachedEnd {
            ZStack{
                
                Rectangle()
                    .frame(width: 800, height: 200)
                    .foregroundColor(Color("colorOne"))
                    .rotationEffect(.degrees(140))
                    .offset(x:50, y:300)
                
                Rectangle()
                    .frame(width: 900, height: 200)
                    .foregroundColor(Color("colorSix"))
                    .rotationEffect(.degrees(-140))
                    .offset(x:50, y:-230)
                
                
                VStack(spacing: 20){
//                    Text("QUIZ GAME")
//                        .MainTitle()
//
                    Text("Congratulations")
                        .font(.system(size: 35, weight: .bold)).padding(.all)
                    Text("You completed the game! 🎉")
                        //.padding(.all)
                    
                    Text("Score \(triviaManager.score) out of \(triviaManager.length)")
                        .bold()
                        .foregroundColor(Color("colorFour"))
                    
                    Button {
                        Task.init{
                            await triviaManager.fetchTrivia()
                        }
                    } label: {
                        PrimaryButton(text: "Play again")
                    }
                }
                .foregroundColor(Color("grayColor"))
                .padding(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               // .background(.white)
                .navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
            }
       } else{
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
