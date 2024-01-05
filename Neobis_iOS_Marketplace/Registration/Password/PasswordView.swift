//
//  PasswordView.swift
//  Neobis_iOS_Marketplace
//

import UIKit
import SnapKit

class PasswordView: UIView {
    
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
    
    lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closedEye"), for: .normal)
        button.backgroundColor = UIColor(red: 192/255.0, green: 192/255.0, blue: 192/255.0, alpha: 0.2)
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 27)
        button.layer.cornerRadius = 14
        
        return button
    }()
    
    lazy var lockImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lock"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a new password"
        label.font = UIFont(name: "GothamPro-Medium", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = " Минимальная длина — 8 символов. \n Для надежности пароль должен \nсодержать буквы и цифры."
        label.font = UIFont(name: "GothamPro", size: 16)
        label.textColor = .systemGray4
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .clear
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        textfield.font = UIFont(name: "GothamPro-Medium", size: 24)
        
        return textfield
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22
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
        addSubview(lockImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(passwordTextField)
        addSubview(nextButton)
    }
    
    func setupConstraints(){
        lockImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
            make.height.width.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lockImage.snp.bottom).offset(20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(91)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
