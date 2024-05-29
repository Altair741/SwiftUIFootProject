//
//  PDFdocument.swift
//  ICT_footassessment
//
//  Created by 강민구 on 1/5/2024.
// reference : Swift: PDFKit Introduction (2021, Xcode, iOS) - Swift for Beginners,
// https://www.youtube.com/watch?v=GaNYWnlV3R4&t=160s
//
//

import SwiftUI
import PDFKit

struct PDFdocument: UIViewRepresentable {
    
    let pdfDoc: PDFDocument
    
    init(pdfDoc: PDFDocument) {
        self.pdfDoc = pdfDoc
    }
    func makeUIView(context: Context) -> PDFView
    {
        let pdfView = PDFView()
        pdfView.document = pdfDoc
        pdfView.autoScales = true
        
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDoc
    }
    
        
}
