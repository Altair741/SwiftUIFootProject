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
    @State private var selectedClinic: Clinic? // To hold the selected clinic
    @State private var showHomeScreen = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                TextField("Work Email", text: $workEmail)
                
                // ClinicMapView is initialized here with selectedClinic binding
                ClinicMapView(selectedClinic: $selectedClinic)
            }
            .navigationTitle("Sign In")
        }
    }
}
    
        
struct ClinicMapView: View {
    @Binding var selectedClinic: Clinic? // Make selectedClinic a binding
    @StateObject private var locationManager = LocationManager()
    @State private var searchQuery: String = ""
    @State private var filteredClinics: [Clinic] = []
    
    let clinics: [Clinic] = [ // Sample clinic data (replace with your own)
        Clinic(name: "Pika Wiya Health Service", coordinate: CLLocationCoordinate2D(latitude: -32.4952351, longitude: 137.7771713)),
        Clinic(name: "Moorundi Aboriginal Health", coordinate: CLLocationCoordinate2D(latitude: -35.1166301, longitude: 139.2794858)),
        Clinic(name: "Amata Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.1514499, longitude: 126.6642173)),
        Clinic(name: "Fregon Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.7634704, longitude: 132.0276193)),
        Clinic(name: "Iwantja Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.9650009, longitude: 132.1561362)),
        Clinic(name: "Mimili Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -32.0576, longitude: 138.5965)),
        Clinic(name: "Nyapari Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -32.0576, longitude: 138.5965)),
        Clinic(name: "Pipalyatjara Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.9996753, longitude: 132.6748486)),
        Clinic(name: "Pukatja Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.6444829, longitude:132.0092038 )),
        Clinic(name: "Port Lincoln Aboriginal Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -34.726876, longitude: 135.8495284)),
        Clinic(name: "Nunkuwarrin Yunti of South Australia Inc", coordinate: CLLocationCoordinate2D(latitude: -34.918145, longitude: 5906645)),
        Clinic(name: "Nunyara Aboriginal Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -34.9259765, longitude: 138.563812)),
        Clinic(name: "Yalata Clinic Tullawon Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -31.4821191, longitude: 131.8360786)),
        Clinic(name: "Oak Valley Clinic Tullawon Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -31.4803521, longitude: 131.875089)),
        Clinic(name: "Umoona Tjutagku Health Service Aboriginal Corporations", coordinate: CLLocationCoordinate2D(latitude: -29.0034228, longitude: 134.7612495)),
        Clinic(name: "Pangula Mannamurna Aboriginal Corporation", coordinate: CLLocationCoordinate2D(latitude: -37.8239957, longitude: 140.7496647)),
        Clinic(name: "Yadu Health Aboriginal Corporation", coordinate: CLLocationCoordinate2D(latitude: -32.125908, longitude: 133.670129)),
    ]
    
    var body: some View {
        VStack {
            TextField("Search health clinics", text: $searchQuery)
                .padding()
                .onChange(of: searchQuery) { query in // Update filteredClinics on every keystroke
                    filteredClinics = clinics.filter { $0.name.localizedCaseInsensitiveContains(query) }
                }

            Map(coordinateRegion: $locationManager.region, annotationItems: filteredClinics) { clinic in
                MapMarker(coordinate: clinic.coordinate, tint: .blue)
            }
            .frame(height: 200) // Adjust map height as needed

            List(filteredClinics) { clinic in
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
            filteredClinics = clinics // Initially show all clinics
        }
    }
}

