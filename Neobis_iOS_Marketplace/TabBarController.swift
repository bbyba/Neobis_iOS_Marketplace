//
//  TabBarController.swift
//  Neobis_iOS_Marketplace
// 1

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barStyle = .default
        tabBar.tintColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = true
        configureTabs()
    }
    
    private func configureTabs(){
        lazy var vc1 = MainViewController()
        lazy var vc2 = WalletViewController()
        lazy var vc3 = AddViewController()
        lazy var vc4 = ChatsViewController()
        lazy var vc5 = ProfileViewController()
        
        //Set tab images
        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "tabbarWallet")
        if let image = UIImage(named: "tabbarAdd") {
            vc3.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        }
        vc4.tabBarItem.image = UIImage(named: "tabbarChat")
        vc5.tabBarItem.image = UIImage(named: "tabbarProfile")
        
        //Title
        vc1.tabBarItem.title = "Main"
        vc2.tabBarItem.title = "Wallet"
        vc4.tabBarItem.title = "Chats"
        vc5.tabBarItem.title = "Profile"
        
        //To wrap in a navigation controller
        lazy var nav1 = UINavigationController(rootViewController: vc1)
        lazy var nav2 = UINavigationController(rootViewController: vc2)
        lazy var nav3 = UINavigationController(rootViewController: vc3)
        lazy var nav4 = UINavigationController(rootViewController: vc4)
        lazy var nav5 = UINavigationController(rootViewController: vc5)
      
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
    }
}
