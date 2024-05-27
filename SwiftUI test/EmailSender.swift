
import Combine
import Foundation
import MessageUI
import SwiftUI

struct EmailSender: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    var recipients: [String]
    var subject: String
    var messageBody: String
    var isHTML: Bool
    let attachmentData: Data
    let attachmentMimeType: String
    let attachmentFileName: String
    @EnvironmentObject var answer: UserAnswer
    
    
    func makeCoordinator() -> MailComposerCoordinator {
        return MailComposerCoordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        
        print("Creating MFMailComposeViewController")
        
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = context.coordinator
        mailComposeViewController.setToRecipients(recipients)
        mailComposeViewController.setSubject(subject)
        mailComposeViewController.setMessageBody(messageBody, isHTML: isHTML)
        mailComposeViewController.addAttachmentData(attachmentData, mimeType: attachmentMimeType, fileName: attachmentFileName)
        return mailComposeViewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }
    }


class MailComposerCoordinator: NSObject, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    var parent: EmailSender
    
    init(parent: EmailSender) {
        self.parent = parent
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("Mail composition finished with result: \(result)")
        
        controller.dismiss(animated: true) {
            self.parent.isShowing = false
        }
    }
}
