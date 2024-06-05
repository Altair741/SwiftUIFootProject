
//
//  EmailSender.swift
//  SwiftUI test
//
//  Created by Ethan Li on 19/5/2024.
// ref : https://www.youtube.com/watch?v=aJ0Fz4rCZbw&t=471s
//
import Combine
import Foundation
import MessageUI
import SwiftUI
import Combine
import Foundation
import MessageUI
import SwiftUI

// Structure to bridge SwiftUI with UIKit's MFMailComposeViewController for sending emails.
struct EmailSender: UIViewControllerRepresentable {
    @Binding var isShowing: Bool  // Controls the presentation/dismissal of the email composer view.
    var recipients: [String]     // Array of email addresses to send to.
    var subject: String          // Subject line of the email.
    var messageBody: String
    var isHTML: Bool            // Indicates if the email body is in HTML format.
    let attachmentData: Data
    let attachmentMimeType: String  // MIME type of the attachment (e.g., "text/plain", "image/jpeg").
    let attachmentFileName: String // Name of the attachment file.
    @EnvironmentObject var answer: UserAnswer  // Access assessment data to include in the email.

    // Creates the MailComposerCoordinator (delegate for email composition).
    func makeCoordinator() -> MailComposerCoordinator {
        return MailComposerCoordinator(parent: self)
    }

    // Creates and configures the MFMailComposeViewController.
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        print("Creating MFMailComposeViewController") // Log message for debugging.
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = context.coordinator // Set delegate.
        mailComposeViewController.setToRecipients(recipients)              // Set recipients.
        mailComposeViewController.setSubject(subject)                    // Set subject.
        mailComposeViewController.setMessageBody(messageBody, isHTML: isHTML)  // Set body.
        mailComposeViewController.addAttachmentData(attachmentData, mimeType: attachmentMimeType, fileName: attachmentFileName) // Add attachment.
        return mailComposeViewController
    }

  
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }
}

// Coordinator class to handle email composition results and delegate methods.
class MailComposerCoordinator: NSObject, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    var parent: EmailSender        // Reference to the EmailSender to update UI.

    init(parent: EmailSender) {
        self.parent = parent
    }

    // Delegate method called when the user finishes composing the email.
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("Mail composition finished with result: \(result)") // Log result for debugging.

        // Dismiss the mail composer view.
        controller.dismiss(animated: true) {
            self.parent.isShowing = false  // Hide the email composer in the SwiftUI view.
        }
    }
}
