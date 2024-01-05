//
//  ViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView = LoginView()
    lazy var profileVC = ProfileViewController()
//    let registerVC = RegisterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupConstraintsMainView()
        addTargets()
    }
    
    func setupConstraintsMainView(){
        loginView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets(){
        loginView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }

    @objc func loginPressed(){
        print("login pressed")
//        navigationController?.pushViewController(profileVC, animated: true)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = MainTabBarController()
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    @objc func registerPressed(){
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

