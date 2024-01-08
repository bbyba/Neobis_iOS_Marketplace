//
//  FavoritesView.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class FavoritesView: UIView {
    
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
        label.text = "Favorites"
        label.font = UIFont(name: "GothamPro-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
    lazy var emptyBoxImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "emptyBox"))
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = false
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Oops, Empty :("
        label.font = UIFont(name: "GothamPro-Medium", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(emptyBoxImage)
        addSubview(titleLabel)
    }
    
    func setupConstraints(){
        emptyBoxImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(130)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyBoxImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
