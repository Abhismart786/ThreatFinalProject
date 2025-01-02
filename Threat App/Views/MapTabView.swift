import SwiftUI
import MapKit
import CoreLocation

struct MapViewController: View {
    @Environment(\.dismiss) var dismiss  // Dismiss action to close the view
    @State private var address: String = ""  // Address input field
    @State private var coordinates = CLLocationCoordinate2D(latitude: 45.5017, longitude: -73.5673)  // Default coordinates
    
    var body: some View {
        NavigationView {
            VStack {
                // TextField to input the address
                TextField("Enter Address", text: $address, onCommit: {
                    fetchLocation(for: address)  // Fetch coordinates based on address
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)

                // MapView to display the coordinates
                MapView(coordinate: $coordinates, address: $address)
                    .frame(height: 400)  // Map frame height
                    .padding()

                Spacer()  // To push the content upwards
            }
            .padding()
            .navigationTitle("Map View")  // Set the title of the navigation bar
            .navigationBarItems(leading: Button(action: {
                dismiss()  // Dismiss the view when back button is tapped
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)// Back arrow icon
                    Text("Back")
                        .foregroundColor(.black)// Text for the back button
                }
            })
        }
    }
    
    // Function to fetch coordinates from address using CLGeocoder
    func fetchLocation(for address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                print("Error geocoding address: \(error)")
                return
            }
            guard let placemark = placemarks?.first else { return }
            self.coordinates = placemark.location?.coordinate ?? CLLocationCoordinate2D()
        }
    }
}

#Preview {
    MapViewController()
}

