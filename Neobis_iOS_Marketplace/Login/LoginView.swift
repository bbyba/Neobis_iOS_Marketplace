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
        label.font = UIFont(name: "Nunito-Black", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Username"
        
        return textfield
    }()
    
    lazy var passwordTextField: PasswordTextField = {
        let textfield = PasswordTextField()
        textfield.placeholder = "Password"
        
        return textfield
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.setTitleColor(UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1), for: .normal)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(trolleyImage)
        addSubview(titleLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    func setupConstraints(){
        trolleyImage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(110)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(trolleyImage.snp.bottom).offset(8)
            make.height.equalTo(25)
        }
        
        usernameTextField.snp.makeConstraints(){ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints(){ make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints(){ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(82)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(44)
        }
        
        registerButton.snp.makeConstraints(){ make in
            make.bottom.equalToSuperview().inset(44)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(44)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
