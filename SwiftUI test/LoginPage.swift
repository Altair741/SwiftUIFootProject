//
//  LoginPage.swift
//  FootTest
//
//  Created by Ethan Li on 7/5/2024.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct Clinic: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct SignInView: View {
    @State private var name: String = ""
    @State private var workEmail: String = ""
    @State private var selectedClinic: String = "" // Assuming you have an array of clinics
    @State private var showHomeScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                TextField("Work Email", text: $workEmail)
                ClinicMapView()
                
     
           
                }
            }
        }
        
struct ClinicMapView: View {
    @StateObject private var locationManager = LocationManager() // Handles location services
    @State private var searchQuery: String = ""
    @State private var nearbyClinics: [Clinic] = [] // Replace with your Clinic data structure
    
    @State private var selectedClinic: Clinic? // Initially no selection
    @State private var showConfirmationBar = false
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    
    private func searchClinics() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        request.region = locationManager.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                // Handle error if there is one
                return
            }
            
            // Convert MKMapItems into your Clinic struct
            self.nearbyClinics = response.mapItems.map { item in
                Clinic(name: item.name ?? "Unknown Clinic", coordinate: item.placemark.coordinate)
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search health clinics", text: $searchQuery)
                .padding()
                .onSubmit { // Call search when Enter/Return is pressed
                    searchClinics()
                }
            
            
            Map(coordinateRegion: $locationManager.region, annotationItems: nearbyClinics) { clinic in
                MapMarker(coordinate: clinic.coordinate, tint: .blue)
            }
            List(nearbyClinics) { clinic in
                HStack {
                    Text(clinic.name)
                    Spacer()
                    if selectedClinic?.id == clinic.id {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                    }
                }
                .onTapGesture {
                    selectedClinic = clinic
                }
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
    }
}
}

