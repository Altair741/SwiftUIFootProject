import UIKit
import SwiftUI
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    let sendEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Mail", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(sendEmailButton)
        setupButtonConstraints()
    }
    
    func setupButtonConstraints() {
        sendEmailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendEmailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func sendEmail() {
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "Error", message: "Mail services are not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self
        mailComposeViewController.setSubject("Subject")
        mailComposeViewController.setMessageBody("Email body", isHTML: false)
        
        present(mailComposeViewController, animated: true, completion: nil)
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}


struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Any updates can be handled here
    }
}
