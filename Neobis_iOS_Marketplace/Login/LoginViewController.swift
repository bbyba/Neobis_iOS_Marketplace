//
//  ViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView = LoginView()
    lazy var profileVC = ProfileViewController()
    lazy var registerView = RegisterView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
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
//    @objc func registerPressed(){
//        let registerVC = UINavigationController(rootViewController: RegisterViewController(viewModel: RegisterViewModel()))
//        navigationController?.pushViewController(registerVC, animated: true)
//    }
    @objc func registerPressed(){
        let registerVC = RegisterViewController(viewModel: RegisterViewModel())
        navigationController?.pushViewController(registerVC, animated: true)
    }

//    @objc func registerPressed(){
//        let registerVC = RegisterViewController(viewModel: RegisterViewModel())
//        let navController = UINavigationController(rootViewController: registerVC)
//        navigationController?.present(navController, animated: true, completion: nil)
//    }
}

