//
//  MapExtensions.swift
//  SoloGuard
//
//  Created by Sam Chen on 2/3/24.
//

import Foundation
import MapKit

extension MapController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer()
    }

    // Add other MKMapViewDelegate methods as needed
}
