//
//  QuizView.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import SwiftUI

struct QuizView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            ZStack{
              // Background()
                
                VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("Quiz")
                            .font(.system(size: 60)).bold()
                            .foregroundColor(Color("grayColor"))
                           // .shadow(radius: 5, x:0, y:5)
                        
                        Text("Are you ready to start the game?")
                            .foregroundColor(Color("grayColor"))
                    }
                    
                    NavigationLink{
                        TriviaView()
                            .environmentObject(triviaManager)
                    } label : {
                        PrimaryButton(text: "Let's go")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                //.background(Color.white)
                .background(Image("ImageTwo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

struct Background: View{
    var body: some View{
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
        
    }
}
