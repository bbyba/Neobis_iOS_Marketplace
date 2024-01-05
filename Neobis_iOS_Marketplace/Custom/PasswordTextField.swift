//
//  PasswordTextField.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class PasswordTextField: UITextField {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
        enablePasswordToggle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
        enablePasswordToggle()
    }

    private func setupTextField() {
        self.backgroundColor = .white
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
//        self.clearButtonMode = .whileEditing
        self.textColor = .black
        if let font = UIFont(name: "GothamPro-Medium", size: 16) {
            self.font = font
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.font: font])
        }
        self.isSecureTextEntry = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
}

extension PasswordTextField {
    
    private func setEyeImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "openEye"), for: .normal)
        }else{
            button.setImage(UIImage(named: "closedEye"), for: .normal)

        }
    }

    func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        setEyeImage(button)
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always

        button.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().offset(-5)
            make.width.height.equalTo(32)
        }
    }
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setEyeImage(sender as! UIButton)
    }
}
