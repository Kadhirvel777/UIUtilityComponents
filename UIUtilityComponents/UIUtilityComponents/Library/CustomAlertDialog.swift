//
//  CustomAlertDialog.swift
//  UIUtilityComponents
//
//  Created by Kadhirvel on 09/08/22.
//

import Foundation
import UIKit

protocol CustomAlertDialogDelegate: class {
    func okButtonPressed(_ alert: CustomAlertDialog, alertTag: Int)
    func cancelButtonPressed(_ alert: CustomAlertDialog, alertTag: Int)
}
class CustomAlertDialog: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
    
    var alertTitle = ""
    var alertMessage = ""
    var okButtonTitle = "Ok"
    var cancelButtonTitle = "Cancel"
    var alertTag = 0
    var statusImage = UIImage.init(named: "smiley")
    var isCancelButtonHidden = false
    
    weak var delegate: CustomAlertDialogDelegate?

    init() {
        super.init(nibName: "CustomAlertDialog", bundle: Bundle(for: CustomAlertDialog.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
    func show() {
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    func setupAlert() {
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        statusImageView.image = statusImage
        okButton.setTitle(okButtonTitle, for: .normal)
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.isHidden = isCancelButtonHidden
    }
    @IBAction func actionOnOkButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.okButtonPressed(self, alertTag: alertTag)
    }
    @IBAction func actionOnCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.cancelButtonPressed(self, alertTag: alertTag)
    }
   
}

extension UIViewController{
    // MARK: UIViewController's loader methods
    func startLoader(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
        } else {
            // Fallback on earlier versions
        }
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func stopLoader() {
        dismiss(animated: false, completion: nil)
    }
}
