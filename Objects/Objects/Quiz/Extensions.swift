//
//  Extensions.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import Foundation
import SwiftUI

extension Text {
    func MainTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("grayColor"))
            //.foregroundColor(.black)
    }
}
