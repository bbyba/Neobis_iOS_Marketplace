//
//  RegisterView.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class RegisterView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.backgroundColor = UIColor(red: 192/255.0, green: 192/255.0, blue: 192/255.0, alpha: 0.2)
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 27)
        button.layer.cornerRadius = 14
        
        return button
    }()
    
    lazy var tabBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = UIFont(name: "GothamPro-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
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
    
    lazy var emailTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Email"
        
        return textfield
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22
//        button.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        button.backgroundColor = .gray
        button.isEnabled = false
        
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
        addSubview(emailTextField)
        addSubview(loginButton)
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
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        emailTextField.snp.makeConstraints(){ make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints(){ make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
