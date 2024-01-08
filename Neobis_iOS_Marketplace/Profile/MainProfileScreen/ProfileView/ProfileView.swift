//
//  ProfileView.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import SnapKit

class ProfileView: UIView {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.text = "Profile"
        text.font = UIFont(name: "GothamPro-Medium", size: 18)
        
        return text
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изм.", for: .normal)
        button.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 0.2)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 27)
        button.layer.cornerRadius = 14
        
        return button
    }()

    lazy var userImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "defaultProfile"))
        image.contentMode = .scaleAspectFit
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = false
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTVCell.self, forCellReuseIdentifier: "ProfileTVCell")
        tableView.rowHeight = 70
        
        return tableView
    }()
    
    lazy var profileCategories = [
        [   profileCategory(category: "Favorites", image: "favorites"),
            profileCategory(category: "My Products", image: "stall")
        ],
        [   profileCategory(category: "Log out", image: "leave")
        ]
    ]
    
    lazy var finishRegistationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        button.setTitle("Finish registration", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.layer.cornerRadius = 22
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(userImage)
        addSubview(userName)
        addSubview(tableView)
        addSubview(finishRegistationButton)
    }
    
    func setupConstraints(){
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(225)
        }
        
        finishRegistationButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
