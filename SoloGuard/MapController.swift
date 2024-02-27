//
//  MapView.swift
//  SoloGuard
//
//  Created by Sam Chen on 1/20/24.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class MapController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
        var locationManager = CLLocationManager()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupMapView()
            setupLocationManager()
            setupUI()

            // Call displayDirections along with setupUI
            displayDirections()
        }

        func setupMapView() {
            mapView.delegate = self
            mapView.showsUserLocation = true
        }

        func setupLocationManager() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }

        func setupUI() {
            // Create a button to trigger displaying directions
            let directionsButton = UIButton(type: .system)
            directionsButton.setTitle("Display Directions", for: .normal)
            directionsButton.addTarget(self, action: #selector(displayDirections), for: .touchUpInside)

            // Stack view to hold the button
            let stackView = UIStackView(arrangedSubviews: [mapView, directionsButton])
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 8

            // Add the stack view to the main view
            view.addSubview(stackView)

            // Add constraints for the stack view to fill the main view
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackView.topAnchor.constraint(equalTo: view.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    
    @objc func displayDirections() {
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // Example: San Francisco
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437) // Example: Los Angeles

        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        let directions = MKDirections(request: directionRequest)

        directions.calculate { (response, error) in
            if let route = response?.routes.first {
                self.mapView.addOverlay(route.polyline, level: .aboveRoads)

                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }
}

// SwiftUI wrapper
struct MapControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MapController {
        return MapController()
    }

    func updateUIViewController(_ uiViewController: MapController, context: Context) {
        // Update logic here if needed
    }
}
