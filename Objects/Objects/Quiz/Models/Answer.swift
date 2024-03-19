//
//  Answer.swift
//  Objects
//
//  Created by Surya Sharma on 7/7/23.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
    
}
