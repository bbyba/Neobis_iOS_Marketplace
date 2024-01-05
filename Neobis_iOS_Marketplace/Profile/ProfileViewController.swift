//
//  ProfileViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = profileView.titleLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileView.changeButton)
    }
    
    override func loadView() {
        self.view = profileView
    }
}
 
    

