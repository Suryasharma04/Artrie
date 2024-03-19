//
//  TabView.swift
//  Objects
//
//  Created by Surya Sharma on 7/6/23.
//

import SwiftUI

struct TabView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    @State private var shouldRemoveAllModels = false
    
    @State var selectedIndex = 2
    @State var presented: Bool = false
    let icons = ["house.circle.fill", "location.circle.fill", "circle.fill", "trophy.circle.fill", "person.crop.circle.fill"]
    
    
    private var models: [Model] = {
          let fileManager = FileManager.default
          guard let path = Bundle.main.resourcePath,
                let files = try? fileManager.contentsOfDirectory(atPath: path) else {
              return []
          }
          return files
              .filter { $0.hasSuffix(".usdz") }
              .compactMap { $0.replacingOccurrences(of: ".usdz", with: "") }
              .compactMap { Model(modelName: $0 ) }
      }()
    
    var body: some View {
        VStack{
            ZStack{
                    Spacer().fullScreenCover(isPresented: $presented, content: {
                        Text("Full Screen")
                    })
                    
                    switch selectedIndex{
                    case 0:
                        NavigationView{
                            HomeView()
                        }
                        
                    case 1:
                        NavigationView{
                            LocationView()
                        }
                        
                    case 2:
                        ZStack(alignment: .bottom) {
                                   ARViewRepresentable(
                                       modelConfirmedForPlacement: $modelConfirmedForPlacement,
                                       shouldRemoveAllModels: $shouldRemoveAllModels
                                   )

                                       if isPlacementEnabled {
                                           PlacementButtonView(
                                               isPlacementEnabled: $isPlacementEnabled,
                                               selectedModel: $selectedModel,
                                               modelConfirmedForPlacement: $modelConfirmedForPlacement
                                           )
                                      } else {
                                           ModelPickerView(
                                               isPlacementEnabled: $isPlacementEnabled,
                                               selectedModel: $selectedModel,
                                               models: models
                                           )
                                    }
                            }
                        .edgesIgnoringSafeArea(.all)
                        
                    case 3:
                        NavigationView{
                            QuizView()
                        }
                        
                    default:
                        NavigationView{
                            InfoView()
                        }
                    }
                }
            
           // Divider().background(.red)
            HStack{
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                        
                        //if else is optional here
//                        if number == 2 {
//                            presented.toggle()
//                        }
//                        else{
//                            self.selectedIndex = number
//                        }
                        
                    }, label: {
                        if number == 2 {
                            Image(systemName: icons[number])
                                .foregroundColor(Color.blue)
                                .font(.system(size: 30,
                                              weight: .regular,
                                              design: .default))
                                .frame(width: 60, height: 60)
                                .background(Color.gray).opacity(0.5)
                                .cornerRadius(30)
                            
                        } else{
                            Image(systemName: icons[number])
                                .foregroundColor(selectedIndex == number ? Color("colorTwo") : Color(UIColor.lightGray))
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                        }
                        
                    })
                    Spacer()
                }
                
            }
            
        }
        .background(.white)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
