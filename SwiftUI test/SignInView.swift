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
                    isExpanded: $isWorkplaceListExpanded, // Controls expansion
                    content: {
                        List {
                            ForEach(clinics, id: \.self) { clinic in
                                Button(action: {
                                    selectedClinic = clinic
                                    region.center = clinic.coordinate // Update map
                                }) {
                                    Text(clinic.name)
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
                                    navigateToEndPage = true // Trigger navigation to EndPage
                                }
                            } message: {
                                Text("Do you want to register?")
                            }
                            .fullScreenCover(isPresented: $showSignInView) { // Use fullScreenCover for SignInView
                                SignInView()
                            }
            
            
                            .navigationDestination(for: Bool.self) { destination in
//                                if navigateToEndPage {
//                                    EndPage(clinicName: String, workEmail: String, clinicWorkplace: String)
//                                } else {
//                                    // No destination if not navigating
//                                    EmptyView()
//                                }
                               
                            }
            
//                                NavigationLink( destination: EndPage(
//                                    clinicName: self.clinicName,
//                                    workEmail: self.workEmail,
//                                    clinicWorkplace: self.selectedClinic?.name ?? ""
//                                ), isActive: $navigateToEndPage)
//                                {
//                                    EmptyView()
//                                }
//                            
                            
                            
                            .fullScreenCover(isPresented: $navigateToEndPage) {
                                EndPage(
                                    clinicName: self.clinicName,
                                    workEmail: self.workEmail,
                                    clinicWorkplace: self.selectedClinic?.name ?? ""
                            )
            }
        }.onAppear {
            self.showRegisterAlert = true
        }
        .onDisappear(){
            self.showRegisterAlert = false
        }
    }
}
