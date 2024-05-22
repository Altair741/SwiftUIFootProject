import Foundation
import MessageUI
import SwiftUI


class EmailSender: MFMailComposeViewController {
    init(recipients: [String]?, subject: String = "Foot Assessment Result", messageBody: String = "",messageBodyIsHTML: Bool = false, resultURL : URL? )
    {
        super.init(nibName: nil, bundle: nil)
        setToRecipients(recipients)
        setSubject(subject)
        setMessageBody(messageBody, isHTML: messageBodyIsHTML)
        
        if let resultURL = resultURL, let fileData = try? Data(contentsOf: resultURL) {
                  addAttachmentData(fileData, mimeType: "application/pdf", fileName: resultURL.lastPathComponent)
              }
    }
    required init?(coder aDecoder : NSCoder){
        fatalError("Error")
    }
}


struct EmailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var answer: UserAnswer
    
    var recipients: [String]
    var subject: String
    var messageBody: String
    var isHTML: Bool
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposeViewController = EmailSender(
            recipients: recipients,
            subject: subject,
            messageBody: messageBody,
            messageBodyIsHTML: isHTML,
            resultURL : answer.pdf_url
            
        )
        mailComposeViewController.mailComposeDelegate = context.coordinator
        return mailComposeViewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: EmailView
        
        init(_ parent: EmailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true) {
                self.parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
