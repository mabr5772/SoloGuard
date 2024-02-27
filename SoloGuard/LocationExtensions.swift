//
//  LocationExtensions.swift
//  SoloGuard
//
//  Created by Sam Chen on 2/3/24.
//

import Foundation
import CoreLocation

extension MapController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates if needed

        // The locations array contains CLLocation objects representing the device's current location.
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude

            // Do something with the latitude and longitude, such as updating the map or performing other tasks.
            print("Latitude: \(latitude), Longitude: \(longitude)")
        }
    }
}
