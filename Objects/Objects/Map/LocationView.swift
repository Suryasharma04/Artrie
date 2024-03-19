import CoreLocation
import MapKit
import SwiftUI

struct LocationView: View {
    @StateObject private var viewModel = MapViewModel()
    
    let annotations = [Place(name: "IC Library", coordinate: CLLocationCoordinate2D(latitude: 42.42126, longitude: -76.49506)), Place(name: "Roy Park School", coordinate: CLLocationCoordinate2D(latitude: 42.424203, longitude: -76.495411))]
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations){
            place in
            MapAnnotation(coordinate: place.coordinate){
                HStack{
                    Image(systemName: "mappin.circle.fill")
//                        .shadow(radius: 10)
                        .foregroundColor(Color("colorThree"))
                   
                    Text(place.name).fixedSize()
                            .foregroundColor(Color.black)
                            .font(.system(size: 14))
                            .bold()
                }
                .padding(.all,7)
                .background(.white)
                .cornerRadius(21)
                .shadow(radius: 5)
                
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .rotationEffect(Angle(degrees: 270))
                        .foregroundColor(Color.white)
                        .offset(y: 20)
                    
                    , alignment: .center)
                
            }
        }
            .ignoresSafeArea()
            .accentColor(Color("colorTwo"))
            .onAppear{
                viewModel.checkIfLocationServicesEnabled()
            }
    }
}

//make customised annotated pins for the view:

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct Place: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
