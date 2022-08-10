//
//  TextLabel.swift
// UIUtilityComponents
//
//  Created by Kadhirvel on 09/08/22.
//

import UIKit

class TextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(Text: String) {
        self.init(frame: .zero)
        self.text = Text
        self.textColor = .white
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
