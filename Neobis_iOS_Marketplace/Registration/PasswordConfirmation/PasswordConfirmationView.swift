//
//  PasswordConfirmationView.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class PasswordConfirmationView: PasswordView {
    
    lazy var confirmPasswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .clear
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        textfield.font = UIFont(name: "GothamPro-Medium", size: 24)
        
        return textfield
    }()
    
    lazy var mismatchPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Passwords don't match"
        label.textColor = .red
        label.font = UIFont(name: "GothamPro", size: 12)
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsForConfirmation()
    }
    
    private func setupViewsForConfirmation() {
        titleLabel.text = "Confirm your password"
        nextButton.setTitle("Done", for: .normal)
        
        addSubview(confirmPasswordTextField)
        addSubview(mismatchPasswordLabel)
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        mismatchPasswordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
