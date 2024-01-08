//
//  PersonalInfoTVCell.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import UIKit
import SnapKit

class PersonalInfoTVCell: UITableViewCell {
    
    lazy var category: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont(name: "GothamPro-Medium", size: 16)
        textField.clearButtonMode = .whileEditing
//        textField.
        
        return textField
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: personalInfoCategory){
        category.placeholder = data.category
    }
    
    func addSubviews(){
        contentView.addSubview(category)
    }
    
    func setupConstraints(){
        category.snp.makeConstraints(){ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

