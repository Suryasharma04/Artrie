//
//  Model.swift
//  Objects
//
//  Created by Surya Sharma on 7/10/23.
//
import SceneKit
import SwiftUI
import RealityKit
import Combine


class Model{
    
    static let modelNames = [
        //"chair_swan",
        "cup_saucer_set",
        "fender_stratocaster",
        "flower_tulip",
        "gramophone",
        "robot_walk_idle",
        "teapot",
        "toy_drummer_idle",
        "tv_robot",
        "wateringcan"
]
    
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName:String){
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink{ loadCompletion in
                if case .failure(let error) = loadCompletion {
                    print("DEBUG: Unable to load modelEntity for modelName: \(modelName)")
                    print("Error: \(error)")
                }
            } receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.name = modelName
                print("DEBUG: successfully loaded modelEntity named: \(modelName)")
            }
    }
}

extension Model: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(modelName)
    }
}

extension Model: Equatable {
    static func == (lhs: Model, rhs: Model) -> Bool{
        lhs.modelName == rhs.modelName
    }
}
