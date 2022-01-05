//
//  CustomTextField.swift
//  clockInOut
//
//  Created by armyxx on 5/1/2565 BE.
//

import UIKit

@IBDesignable
open class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        toStyledTextField()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        toStyledTextField()
    }
    
    func toStyledTextField() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
}
