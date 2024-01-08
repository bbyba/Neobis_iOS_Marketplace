//
//  PasswordConfirmationViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class PasswordConfirmationViewController: UIViewController {
    
    lazy var passwordConfirmationView = PasswordConfirmationView()
    var viewModel: RegisterViewModel?
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = passwordConfirmationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = passwordConfirmationView.tabBarTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: passwordConfirmationView.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: passwordConfirmationView.hideButton)
        
        addTargets()
    }
    
    func addTargets(){
        passwordConfirmationView.backButton.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        passwordConfirmationView.passwordTextField.addTarget(self, action: #selector(confirmPassword), for: .editingChanged)
        passwordConfirmationView.confirmPasswordTextField.addTarget(self, action: #selector(confirmPassword), for: .editingChanged)
        passwordConfirmationView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmPassword() {
        guard let originalPass = passwordConfirmationView.passwordTextField.text,
                  let checkPass = passwordConfirmationView.confirmPasswordTextField.text,
                  !originalPass.isEmpty, !checkPass.isEmpty else {
                return
            }
        passwordConfirmationView.passwordTextField.textColor = .black
        passwordConfirmationView.confirmPasswordTextField.textColor = .black

        if checkPass == originalPass {
            passwordConfirmationView.mismatchPasswordLabel.isHidden = true
            passwordConfirmationView.nextButton.isEnabled = true
            passwordConfirmationView.nextButton.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        } else {
            passwordConfirmationView.mismatchPasswordLabel.isHidden = false
            passwordConfirmationView.nextButton.isEnabled = false
            passwordConfirmationView.nextButton.backgroundColor = UIColor.gray
            passwordConfirmationView.passwordTextField.textColor = .systemRed
            passwordConfirmationView.confirmPasswordTextField.textColor = .systemRed
        }
    }
    
    @objc func nextButtonTapped(){
        guard let passwordConfirm = passwordConfirmationView.confirmPasswordTextField.text
        else {
            print("Invalid input. Please check your data.")
            return
        }
        
        viewModel?.setPasswordConfirm(inputData: passwordConfirm)
        
        viewModel?.register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//aB1234567
