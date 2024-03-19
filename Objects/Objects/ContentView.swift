import SwiftUI

struct ContentView: View {
        @State private var isPlacementEnabled = false
        @State private var selectedModel: Model?
        @State private var modelConfirmedForPlacement: Model?
        @State private var shouldRemoveAllModels = false
    
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
        ZStack(alignment: .bottom) {

              TabView()
            }
        }
    }



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //HomeView()
    }
}
#endif

//remove button for the models
struct RemoveButton: View{
    @State private var shouldRemoveAllModels = false
    
    var body: some View{
        ZStack(alignment: .top) {
            //TabView()
            Button(role: .destructive) {
                shouldRemoveAllModels = true
            } label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Remove All")
                }
            }
        }
    }
}
