//
//  PasswordViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class PasswordViewController: UIViewController {
    
    lazy var passwordView = PasswordView()
    var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = passwordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = passwordView.tabBarTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: passwordView.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: passwordView.hideButton)

        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTargets(){
        passwordView.backButton.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        passwordView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        passwordView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped(){
        guard let password = passwordView.passwordTextField.text
        else {
            print("Invalid input. Please check your data.")
            return
        }
        
        viewModel.setPassword(inputData: password)
        
        let passwordConfirmationVC = PasswordConfirmationViewController(viewModel: viewModel)
        navigationController?.pushViewController(passwordConfirmationVC, animated: true)
    }
    
    //MARK: - Password check
    
    @objc func passwordTextFieldChanged(_ textField: UITextField) {
        guard let password = textField.text, !password.isEmpty else {
            passwordView.nextButton.isEnabled = false
            passwordView.nextButton.backgroundColor = UIColor.gray
            return
        }
        passwordView.nextButton.isEnabled = isValidPassword(password)
    }
    
    
    func isValidPassword(_ password: String) -> Bool {
        let allRequirementsMet = hasLetters(password) && hasDigit(password) && hasValidLength(password)

        if allRequirementsMet {
            passwordView.passwordTextField.textColor = .black
            passwordView.nextButton.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
        } else {
            passwordView.passwordTextField.textColor = .systemRed
            passwordView.nextButton.backgroundColor = .gray
        }

        return allRequirementsMet
    }
    
    func updateRequirementLabel(_ textfield: UITextField, hasRequirement: Bool) {
        let labelText = textfield.text ?? ""
        
        if hasRequirement {
            textfield.textColor = .systemGreen
        } else {
            textfield.textColor = .systemRed
        }
        
        textfield.text = labelText
    }
    
    func hasValidLength(_ password: String) -> Bool {
        let length = password.count
        let minLength = 8
        let maxLength = 15
        
        return length >= minLength && length <= maxLength
    }
    
    func hasLetters(_ password: String) -> Bool {
        let lowercaseLetterRegex = ".*[a-z]+.*"
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        
        let lowercaseLetterPredicate = NSPredicate(format: "SELF MATCHES %@", lowercaseLetterRegex)
        let uppercaseLetterPredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex)
        
        return lowercaseLetterPredicate.evaluate(with: password) && uppercaseLetterPredicate.evaluate(with: password)
    }
    
    func hasDigit(_ password: String) -> Bool {
        let digitRegex = ".*\\d+.*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@",digitRegex)
        
        return digitPredicate.evaluate(with: password)
    }
}
