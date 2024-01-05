//
//  ProfileTVCell.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class ProfileTVCell: UITableViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var category: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "gothampro", size: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "moreButton")
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: profileCategory){
        image.image = UIImage(named: data.image)
        category.text = data.category
    }
    
    func addSubviews(){
        contentView.addSubview(image)
        contentView.addSubview(category)
        contentView.addSubview(moreButton)
    }
    
    func setupConstraints(){
        image.snp.makeConstraints(){ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        category.snp.makeConstraints(){ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
        
        moreButton.snp.makeConstraints(){ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
