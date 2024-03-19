//
//  InfoView.swift
//  Objects
//
//  Created by Surya Sharma on 7/17/23.
//

import SwiftUI

struct InfoView: View {
    @State var flag: Bool = false
    
    var body: some View {
        //navigation title and settings
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
                    
                    LinearGradient(colors: [Color("colorOne"), Color("colorOneB")], startPoint: .leading, endPoint: .trailing)
                        .foregroundColor(.green)
                    
                        .mask {
                            Circle()
                                .frame(width: 700, height: 700)
                                .offset(x: 0, y: -510)
                        }
                    
                    VStack(spacing: 15){
                        Text("Profile")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        
                            .toolbar{
                                    NavigationLink(destination: SettingsView()) {
                                        Image(systemName: "gearshape.circle")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color("colorThree"))
                                }
                            }
                        
                        Image("photoOne")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(90)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        
                        VStack{
                            Text("User Name")
                                .font(.system(size: 32)).bold()
                                .foregroundColor(.white)
                            
                            Text("@Username")
                                .foregroundColor(.white).bold()
                        
                        }
                        
                        HStack(spacing: 15){
                            Frames(text: "STREAK", score: "13", boardImage: "flame.fill", color: "colorFour")
                            Frames(text: "XP TOTAL", score: "126", boardImage: "bolt.fill", color: "colorFive")
                            Frames(text: "BADGE", score: "34", boardImage: "flag.checkered", color: "colorSix")
                        }
                        //Spacer()
                        .padding(.all)
                        
                        
                        Button {
                            //flag.toggle()
                        } label: {
                            HStack{
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.white)
                                
                                Text("SHARE MY PROGRESS")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }
                            .padding(.all, 15)
                            .background(Color("colorThree"))
                            .cornerRadius(10)
                        }

                        
                        HStack{
                            Text("DASHBOARD")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color("grayColor"))
                            Spacer()
                        }
                        .padding(.all)
                        
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 300, height: 400)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            
                         Text("Analytics of the User")
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.all)
                }
            }
            
        }
        
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


struct Frames: View{
    var text: String
    var score: String
    var boardImage: String
    var color: String
    
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 100, height: 160)
                .cornerRadius(10)
                .shadow(radius: 5)
                .foregroundColor(.white)
            
            VStack(spacing: 15){
                Image(systemName: boardImage)
                    .font(.system(size: 30))
                   .foregroundColor(Color(color))
                    
                Text(score)
                   // .foregroundColor(.black)
                    .foregroundColor(Color("grayColor"))
                    .font(.system(size: 20)).bold()
                
                Text(text)
                   // .foregroundColor(.black)
                    .foregroundColor(Color("grayColor"))
                    .font(.system(size: 15, weight: .semibold))
            }
        }
    }
}
