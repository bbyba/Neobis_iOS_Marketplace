////
////  CustomAlertView.swift
////  Neobis_iOS_Marketplace
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class CustomAlertView: UIView {
//    
//    lazy var alertView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 20
//        view.backgroundColor = .white
//        
//        return view
//    }()
//    
//    lazy var alertImage: UIImage = {
//        let image = UIImage()
//        image.contentMode = .scaleAspectFit
//        
//        return image
//    }()
//    
//    
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Выйти?"
//        label.textAlignment = .center
//        label.font = UIFont(name: "GothamPro-Medium", size: 20)
//        
//        return label
//    }()
//    
//    lazy var yesButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .black
//        button.setTitle("Да, точно", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
//        button.layer.cornerRadius = 12
//        
//        return button
//    }()
//    
//    lazy var noButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Нет, остаться", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
//        
//        return button
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        addSubviews()
//        setupConstraints()
//    }
//    
//    func addSubviews(){
//        addSubview(alertView)
//        alertView.addSubview(titleLabel)
//        alertView.addSubview(subtitleLabel)
//        addSubview(yesButton)
//        addSubview(noButton)
//    }
//    
//    func setupConstraints(){
//        
//        alertView.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.height.equalTo(350)
//            make.width.equalTo(315)
//        }
//        
//        alertImage.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(42.5)
//            make.centerX.equalToSuperview()
//            make.height.equalTo(93)
//            make.width.equalTo(110)
//
//        }
//        
//        titleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(10)
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().inset(10)
//        }
//        
//        subtitleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(titleLabel.snp.bottom).offset(30)
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().inset(10)
//        }
//        
//        yesLogoutButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalToSuperview().inset(30)
//            make.height.equalTo(50)
////            make.width.equalTo(90)
//        }
//        
//        stayButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(yesLogoutButton.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalToSuperview().inset(30)
//            make.height.equalTo(50)
////            make.width.equalTo(90)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func didTapYesLogoutButton() {
//        delegate?.didTapYesLogoutButton()
//    }
//    
//    @objc func didTapStayButton() {
//        delegate?.didTapStayButton()
//    }
//}
