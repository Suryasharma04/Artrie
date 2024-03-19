//
//  SettingsView.swift
//  Objects
//
//  Created by Surya Sharma on 7/20/23.
//

import SwiftUI

struct SettingsView: View {
    @State var flag: Bool = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            ZStack{
                VStack(spacing: 12){
                    profileView()
                    
                    textAndField(text: "Your Name", caption: "Enter name")
                    textAndField(text: "About You", caption: "Say something about you")
                    textAndField(text: "Email", caption: "xxx@icloud.com")
                    
                    Text("Account")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .foregroundColor(Color("grayColor"))
                    
                    MenuView(icon: "lock.circle.fill", text: "Change Password")
                    MenuView(icon: "newspaper.circle.fill", text: "Terms and Conditions")
                    MenuView(icon: "hand.raised.circle.fill", text: "Privacy Policy")
                    MenuView(icon: "heart.fill", text: "Spread the Love")
                    
                    Spacer()
                }
            }
            .background(Image("ImageOne")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct textAndField: View{
    @State var text: String
    @State var caption: String
    @State var input: String = ""
    
    var body: some View{
        VStack(spacing: 10){
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .foregroundColor(Color("grayColor"))
            
            TextField(caption, text: $input)
                .padding(.all, 12)
                .foregroundColor(.gray)
                .background(.white)
                .cornerRadius(12)
                .shadow(radius: 2)
        
        }
        .padding(.all)
        .foregroundColor(.black)
    }
}

struct MenuView: View{
    @State var icon: String
    @State var text: String
    
    var body: some View{
//try list method
        VStack(spacing: 5){

                HStack{
                    Image(systemName: icon)
                        .font(.system(size: 30))

                        .bold()

                    Text(text)
                        .bold()

                    Spacer()
                }
            }
        .padding(.all, 10)
        .background(.white)
        .cornerRadius(12)
        .foregroundColor(Color("grayColor"))
    }
}


struct profileView: View{
    var body: some View{
        ZStack{
            Image("photoOne")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(90)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
            
                .padding(.top)
            
            Image(systemName: "pencil.circle.fill")
                .scaledToFit()
                .background(.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .offset(x:35 , y: 50)
                .font(.system(size: 30))
                .foregroundColor(Color("colorFour"))
            
        }
    }
}
