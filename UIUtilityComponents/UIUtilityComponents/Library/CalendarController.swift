//
//  PopView.swift
// UIUtilityComponents
//
//  Created by Kadhirvel on 09/08/22.
//

import UIKit

class CalendarController : UIViewController {
    
    
    lazy var CustomView : CustomDatePickerView = {
        let v = CustomDatePickerView()
        v.calendarController = self
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(CustomView)
        
        NSLayoutConstraint.activate([
            CustomView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            CustomView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            CustomView.heightAnchor.constraint(equalToConstant: 380),
            CustomView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first?.view {
            if touch == self.view {
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
