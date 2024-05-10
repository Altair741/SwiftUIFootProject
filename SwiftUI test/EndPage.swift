//
//  EndPage.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//
import SwiftUI
import PDFKit
import UIKit

struct EndPage: View {
    @EnvironmentObject var answer: UserAnswer
    @EnvironmentObject var locationManager: LocationManager2
 
    var currentLocation: String {
            guard let placemark = locationManager.placemark else {
                return "Location not available"
            }
            // get location information
            let address = [
                placemark.subThoroughfare ?? "",
                placemark.thoroughfare ?? "",
                placemark.locality ?? "",
                placemark.administrativeArea ?? "",
                placemark.postalCode ?? "",
                placemark.country ?? ""
            ].filter { !$0.isEmpty }.joined(separator: ", ")
            
            return address
        }

    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        VStack
        {
            PDFdocument(pdfDoc: PDFDocument(data: createPDF())!)
            Button(action: {savePDF()}, label: {Text("Save PDF")})
        }
    }
    // func to create PDF
    @MainActor
    private func createPDF() -> Data{
        // Capture current date and time
        
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd. M. yyyy HH:mm:ss"
        dateFormatter.dateFormat = "dd. M. yyyy"
        let currentTime = Date()
        let formattedDate = dateFormatter.string(from: currentTime)
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(
            // A4 size
        x: 0, y: 0, width: 595, height: 1200
        ))
        
        let data = pdfRenderer.pdfData{ context in context.beginPage()
            
        
            
            // Text goes here
            alignTexst(value: "Assessment Result", x: 0, y: 10, width: 595, height: 50, alignment: .center, textFont: UIFont.systemFont(ofSize: 30, weight: .bold))
            
            // Think of how to capture those data,d
            // Also need to include: location, date, basic info of healthworker, risk assessment.
            alignTexst(value: """
                
                Date: \(formattedDate)
                Location : \(currentLocation)
                Mingu Kang
                UniSA Health Clinic
                Risk assessment level : High
                
                """,x: 0, y: 50, width: 595, height: 595,alignment: .right, textFont: UIFont.systemFont(ofSize: 15, weight: .bold))
            
            alignTexst(value:
            """
                Skin conditions
                
                """,x: 0, y: 170, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 15, weight: .bold))
            alignTexst(value:
            """
                Does/did the patient have callus? \(answer.answerRecord[0])
                
                Does/did the patient have corns?  \(answer.answerRecord[1])
                
                Does/did the patient have tinea? \(answer.answerRecord[2])
                
                Does/did the patient have ulcer? \(answer.answerRecord[3])
                
                Does/did the patient have thickened toenails? \(answer.answerRecord[4])
                
                Does/did the patient have ingrown toenails? \(answer.answerRecord[5])
                
                Does/did the patient have bunions? \(answer.answerRecord[6])
                
                Does/did the patient have hammer and clawed toes? \(answer.answerRecord[7])
                
                Does/did the patient have flat feet? \(answer.answerRecord[8])
                
                Does/did the patient have high arched feet? \(answer.answerRecord[9])
                
                Does/did the patient have Charcot foot? \(answer.answerRecord[10])
                
                Has the patient had any amputations? \(answer.answerRecord[11])
                
                """,x: 0, y: 200, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 13, weight: .regular))
 
        }
        return data
    }
    
    func alignTexst(value :String, x: Int, y: Int, width: Int, height: Int, alignment: NSTextAlignment, textFont: UIFont)
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        let attributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        
        let textRect = CGRect(x: x, y: y, width: width, height: height)
        
        value.draw(in: textRect, withAttributes: attributes)
    }
    @MainActor
    func savePDF(){
        let fileName = "FootAssessmentResult.pdf"
        let pdfData = createPDF()
        
        if let documentDirect = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let documentURL =
            documentDirect.appendingPathComponent(fileName)
            do{
                try pdfData.write(to: documentURL)
                print("PDF saved at: \(documentURL) ")
            } catch
            {
                print("cannt saved PDF document")
            }
        }
    }
}
#Preview {
    EndPage()
}
