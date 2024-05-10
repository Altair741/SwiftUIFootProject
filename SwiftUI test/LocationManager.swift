//
//  LocationManager.swift
//  FootTest
//
//  Created by Ethan Li on 7/5/2024.
//
import SwiftUI
import MapKit
import CoreLocation

import Foundation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion()

    override init() {
        super.init()
        manager.delegate = self
        let adelaideCoordinate = CLLocationCoordinate2D(latitude: -34.9285, longitude: 138.6007)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0) //scale map size
                region = MKCoordinateRegion(center: adelaideCoordinate, span: span) 
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
        }
    }
    
}
