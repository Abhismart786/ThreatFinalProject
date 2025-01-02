import SwiftUI
import MapKit
import CoreLocation

public struct MapView: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var address: String
    
    // Create and return the MKMapView
    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    // Update the MKMapView whenever the coordinate changes
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
        uiView.setRegion(region, animated: true)

        // Remove existing annotations and add the new one
        uiView.removeAnnotations(uiView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }

    // Create the Coordinator to handle MKMapViewDelegate methods
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    // Coordinator class to manage map view delegate methods
    public class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

