//
//  PrimaryButton.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color.gray
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .bold()
            .padding()
            .padding(.horizontal)
            .background(Color("mauve"))
           // .background(LinearGradient(colors: [Color.blue, Color.purple, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(30)
           
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
