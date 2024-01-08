//
//  PersonalInfoView.swift
//  Neobis_iOS_Marketplace
//

import UIKit
import SnapKit

class PersonalInfoView: UIView {

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 0.2)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 27)
        button.layer.cornerRadius = 14
        
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
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
    
    lazy var pickProfilePicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose an image", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.setTitleColor(UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1), for: .normal)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    lazy var personalInfoCategories = [
        [   personalInfoCategory(category: "Name"),
            personalInfoCategory(category: "Surname"),
            personalInfoCategory(category: "Username"),
            personalInfoCategory(category: "Date of Birth")
        ],
        [   personalInfoCategory(category: "0(000)000"),
            personalInfoCategory(category: "Email")
        ]
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonalInfoTVCell.self, forCellReuseIdentifier: "PersonalInfoTVCell")
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//        tableView.tableFooterView = UIView(frame: .zero)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(userImage)
        addSubview(pickProfilePicButton)
        addSubview(tableView)
    }
    
    func setupConstraints(){
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        pickProfilePicButton.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(pickProfilePicButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().offset(100)
            make.height.equalTo(316)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonalInfoView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return personalInfoCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalInfoCategories[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTVCell", for: indexPath) as? PersonalInfoTVCell else {
            fatalError("Unable to dequeue PersonalInfoTVCell")}
        cell.configure(with: personalInfoCategories[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 16 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        footerView.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
      
        return footerView
    }
}


