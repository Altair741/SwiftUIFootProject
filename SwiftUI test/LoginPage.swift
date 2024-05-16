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

struct Clinic: Identifiable, Hashable { // Add Hashable conformance
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    // Equatable conformance
    static func == (lhs: Clinic, rhs: Clinic) -> Bool {
        return lhs.id == rhs.id // We only need to compare IDs for equality
    }
}
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
// ClinicListView.swift
struct ClinicListView: View {
    @Binding var selectedClinic: Clinic?
    @State private var searchQuery: String = ""
    @State private var filteredClinics: [Clinic] = []

    // ... your clinics array ...

    var body: some View {
        VStack {
            TextField("Search your workplace", text: $searchQuery)
                .padding()
                .onChange(of: searchQuery) { query in
                    filteredClinics = clinics.filter { $0.name.localizedCaseInsensitiveContains(query) }
                }

            List(filteredClinics) { clinic in
                Button(action: {
                    selectedClinic = clinic // Update the shared selectedClinic
                }) {
                    HStack {
                        Text(clinic.name)
                        Spacer()
                        if selectedClinic?.id == clinic.id {
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                        }
                    }
                }
            }
        }
        .onAppear {
            filteredClinics = clinics
        }
    }
}

// ClinicMapView.swift
struct ClinicMapView: View {
    @Binding var selectedClinic: Clinic?
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        Map(coordinateRegion: .constant(
            selectedClinic != nil
                ? MKCoordinateRegion(center: selectedClinic!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                : MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -27.4705, longitude: 153.0260), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)) // Default region
        ), annotationItems: selectedClinic != nil ? [selectedClinic!] : []) { clinic in
            MapAnnotation(coordinate: clinic.coordinate) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }
}

// SignInView.swift (Updated)
struct SignInView: View {
    @State private var name: String = ""
    @State private var workEmail: String = ""
    @State private var isListExpanded = false
    @State private var selectedClinic: Clinic?
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                DisclosureGroup(isExpanded: $isListExpanded) {
                    ClinicListView(selectedClinic: $selectedClinic)
                        .frame(height: isListExpanded ? 200 : 0)
                        .clipped()
                } label: {
                    HStack {
                        Text("Select Clinic")
                        //Image(systemName: isListExpanded ? "chevron.up" : "chevron.down")
                    }
                }
                .padding()
                
                ClinicMapView(selectedClinic: $selectedClinic)
                    .frame(height: 400)
                
                
                
            }
        }
    }
}
