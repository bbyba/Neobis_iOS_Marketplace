//
//  CustomTextField.swift
//  Neobis_iOS_Marketplace
//


import Foundation
import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }

    private func setupTextField() {
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.clearButtonMode = .whileEditing
        self.backgroundColor = UIColor(red:248/255, green: 248/255, blue: 248/255, alpha: 1)
        self.textColor = .black
        if let font = UIFont(name: "gothampro", size: 16) {
            self.font = font
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.font: font])
        }
    }
}

