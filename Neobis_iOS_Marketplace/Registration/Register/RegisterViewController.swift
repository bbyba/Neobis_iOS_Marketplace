//
//  RegisterViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class RegisterViewController: UIViewController {

    lazy var registerView = RegisterView()
    lazy var passwordVC = PasswordViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = registerView.tabBarTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: registerView.backButton)
    
        addTargets()
    }
    
    override func loadView() {
        self.view = registerView
    }
    
    func addTargets(){
        registerView.backButton.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        registerView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerView.emailTextField.addTarget(self, action: #selector(textfieldsNotEmpty), for: .editingChanged)
        registerView.usernameTextField.addTarget(self, action: #selector(textfieldsNotEmpty), for: .editingChanged)
    }
    
    @objc func popToPrevious(){
          navigationController?.popViewController(animated: true)
      }
    
    @objc func loginButtonTapped(){
        navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    @objc func textfieldsNotEmpty(){
        guard let username = registerView.usernameTextField.text,
              let email = registerView.emailTextField.text,
              !username.isEmpty,
              !email.isEmpty else {
            registerView.loginButton.backgroundColor = .gray
            registerView.loginButton.isEnabled = false
            return
        }
        
        registerView.loginButton.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        registerView.loginButton.isEnabled = true
    }
}
