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
        x: 0, y: 0, width: 595, height: 2000
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
                Assessment Task
                
                """,x: 0, y: 170, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 15, weight: .bold))
            alignTexst(value:
            """
                What kind of shoes is the patient wearing today?  \(answer.assessmentRecord[0])
                
                Does the patient have pain in their legs when walking?   \(answer.assessmentRecord[1])
                
                Does the patient have pain in their legs when lying down? \(answer.assessmentRecord[2])
                
                Does the patient get pins and needles? \(answer.assessmentRecord[3])
                
                Does the patient feel sharp pain? \(answer.assessmentRecord[4])
                
                Do the patient's feet get numb? \(answer.assessmentRecord[5])
                
                Do the patient’s toes get numb?  \(answer.assessmentRecord[6])
                
                Does the patient make regular podiatrist visits?  \(answer.assessmentRecord[7])
                
                Does the patient smoke?  \(answer.assessmentRecord[8])
                
                What is the current condition of the patient’s skin?  \(answer.assessmentRecord[9])
                
                Is there any swelling around the feet and ankle?  \(answer.assessmentRecord[10])
                
                What is the temperature of the foot?  \(answer.assessmentRecord[11])
                
                

                """,x: 0, y: 200, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 13, weight: .regular))
            
            alignTexst(value:
            """
                Skin conditions
                
                """,x: 0, y: 580, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 15, weight: .bold))
            alignTexst(value:
            """
                Does the patient have callus? \(answer.answerRecord[0])
                
                Does the patient have corns?  \(answer.answerRecord[1])
                
                Does the patient have tinea? \(answer.answerRecord[2])
                
                Has the patient had a previous or current ulcer? \(answer.answerRecord[3])
                
                Does the patient have thickened toenails? \(answer.answerRecord[4])
                
                Does the patient have ingrown toenails? \(answer.answerRecord[5])
                
                Does the patient have bunions? \(answer.answerRecord[6])
                
                Does the patient have hammer and clawed toes? \(answer.answerRecord[7])
                
                Does the patient have flat feet? \(answer.answerRecord[8])
                
                Does the patient have high arched feet? \(answer.answerRecord[9])
                
                Does the patient have Charcot foot? \(answer.answerRecord[10])
                
                Has the patient had any amputations? \(answer.answerRecord[11])
                
                Can you feel the pulse in the dorsalis pedis (DP)
                  - Right foot :  \(answer.answerRecord[12])
                  - Left foot  :  \(answer.answerRecord[13])
                
                Can you feel the pulse in the posterior tibial (TP)
                  - Right foot :  \(answer.answerRecord[14])
                  - Left foot  :  \(answer.answerRecord[15])
                
                MonoFilamentTest: \(answer.answerRecord[16])
                
                """,x: 0, y: 610, width: 595, height: 595,alignment: .left, textFont: UIFont.systemFont(ofSize: 13, weight: .regular))
 
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
