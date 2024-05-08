//
//  LocationManager.swift
//  ICT_footassessment
//
//  Created by 강민구 on 5/5/2024.
//

import Foundation
import MapKit

@MainActor
class LocationManager2: NSObject, ObservableObject{
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion()
    @Published var placemark: CLPlacemark?

    
    private let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager2: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location

        // Perform reverse geocoding to get the placemark from the coordinates
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }

            guard let placemark = placemarks?.first else {
                print("No placemark found")
                return
            }

            self.placemark = placemark
        }
    }
}
