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


// Clinic Model
struct Clinic: Hashable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
    static func == (lhs: Clinic, rhs: Clinic) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.coordinate.latitude == rhs.coordinate.latitude &&
               lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}


struct SignInView: View {
    @State private var clinicName: String = ""
    @State private var workEmail: String = ""
    @State private var selectedClinic: Clinic?
    @State private var showRegisterAlert = false
    @State private var showSignInView = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -34.8071, longitude: 138.6353), // Default: Mawson Lakes
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
let clinics: [Clinic] = [ // Sample clinic data
    Clinic(name: "Pika Wiya Health Service", coordinate: CLLocationCoordinate2D(latitude: -32.4941398, longitude: 137.7723842)),
    Clinic(name: "Moorundi Aboriginal Health", coordinate: CLLocationCoordinate2D(latitude: -35.1121866, longitude: 139.2486634)),
    Clinic(name: "Amata Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.1568559, longitude: 131.0997907)),
    Clinic(name: "Fregon Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.6889759, longitude: 131.759718)),
    Clinic(name: "Iwantja Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.9410862, longitude: 132.8279683)),
    Clinic(name: "Mimili Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -27.0067527, longitude: 132.7067153)),
    Clinic(name: "Nyapari Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.1743746, longitude: 127.7821497)),
    Clinic(name: "Pipalyatjara Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.1619052, longitude: 129.1688651)),
    Clinic(name: "Pukatja Clinic Nganampa Health Council", coordinate: CLLocationCoordinate2D(latitude: -26.6444829, longitude:132.0092038 )),
    Clinic(name: "Port Lincoln Aboriginal Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -34.7435208, longitude: 135.8364323)),
    Clinic(name: "Nunkuwarrin Yunti of South Australia Inc", coordinate: CLLocationCoordinate2D(latitude: -34.926406, longitude: 138.5939996)),
    Clinic(name: "Nunyara Aboriginal Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -34.9236693, longitude: 138.5581879)),
    Clinic(name: "Yalata Clinic Tullawon Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -31.4957322, longitude: 131.804345)),
    Clinic(name: "Oak Valley Clinic Tullawon Health Service Inc", coordinate: CLLocationCoordinate2D(latitude: -31.4803521, longitude: 131.875089)),
    Clinic(name: "Umoona Tjutagku Health Service Aboriginal Corporations", coordinate: CLLocationCoordinate2D(latitude: -29.0133192, longitude: 134.7509542)),
    Clinic(name: "Pangula Mannamurna Aboriginal Corporation", coordinate: CLLocationCoordinate2D(latitude: -37.8212466, longitude: 140.7636669)),
    Clinic(name: "Yadu Health Aboriginal Corporation", coordinate: CLLocationCoordinate2D(latitude: -32.0728348, longitude: 133.5490698)),
]
    @State private var isWorkplaceListExpanded = false
    @State private var showAlert = false
    @State private var navigateToEndPage = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Clinic Details")) {
                    TextField("Name : ", text: $clinicName)
                    TextField("Work Email : ", text: $workEmail)
                        .keyboardType(.emailAddress)
                }


                DisclosureGroup(
                    isExpanded: $isWorkplaceListExpanded,// Controls expansion
                    content: {
                        List {
                            ForEach(clinics, id: \.self) { clinic in
                                Button(action: {
                                    selectedClinic = selectedClinic == clinic ? nil : clinic
                                    region.center = selectedClinic?.coordinate ?? region.center// Update map
                                }) {
                                    HStack {
                                        Text(clinic.name)
                                        Spacer()
                                        if selectedClinic == clinic {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                            }
                        }
                    },
                    label: {
                        Text("Select Workplace")
                    }
                )
                
                Section(header: Text("Clinic Location")) {
                    Map(coordinateRegion: $region, annotationItems: selectedClinic != nil ? [selectedClinic!] : []) { clinic in
                        MapMarker(coordinate: clinic.coordinate, tint: .red) // Customize marker appearance
                    }
                    .frame(height: 200)
                }

                Button(action: {
                                    if clinicName.isEmpty || workEmail.isEmpty || selectedClinic == nil {
                                        showAlert = true
                                    } else {
                                        // Submit registration data (clinicName, workEmail, selectedClinic)
                                        print("Clinic Registered!")
                                        navigateToEndPage = true // Trigger fullScreenCover
                                    }
                                }) {
                                    Text("Register Clinic")
                                }
                            }
            
                            .navigationTitle("Clinic Registration")
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Incomplete Information"),
                                    message: Text("Please fill in all fields."),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                           
                            .alert("Register?", isPresented: $showRegisterAlert) {
                                Button("Yes") {
                                    showRegisterAlert = false
                                }
                                Button("No", role: .cancel) {
                                        showRegisterAlert = false // Alert 닫기
                                        navigateToEndPage = true // EndPage로 이동
                                    }
                                } message: {
                                    Text("Do you want to register?")
                                }
                                .background(
                                    NavigationLink(destination: EndPage(), isActive: $navigateToEndPage) {
                                        EmptyView()
                                    }
                                )

            
            
                                .navigationDestination(for: Bool.self) { destination in
                                }

        }.onAppear {
            self.showRegisterAlert = true
        }
        .onDisappear(){
            self.showRegisterAlert = false
            
        }
    }
}
