//
//  LoginView.swift
//  Neobis_iOS_Marketplace
//
import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var trolleyImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "trolley"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MOBI MARKET"
        label.font = UIFont(name: "nunito", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Username"
        
        return textfield
    }()
    
//    lazy var passwordTextField: PasswordTextField = {
//        let textfield = PasswordTextField()
//        textfield.placeholder = "Password"
//        
//        return textfield
//    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "gothampro", size: 16)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("I don't have an account", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(globeImage)
        addSubview(welcomeBackLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    func setupConstraints(){
        globeImage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
            make.width.equalTo(186)
            make.height.equalTo(194)
        }
        
        welcomeBackLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(globeImage.snp.bottom).offset(31)
        }
        
        usernameTextField.snp.makeConstraints(){ make in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints(){ make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints(){ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints(){ make in
            make.top.equalTo(loginButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
