//
//  RegistrationViewModel.swift
//  Neobis_iOS_Marketplace
//

import Foundation

protocol RegisterViewModelProtocol {

    var username: String? { get set }
    var email: String? { get set }
    var password: String? { get set }
    var passwordConfirm: String? { get set }
    
    func setUsername(inputData: String)
    func setEmail(inputData: String)
    func setPassword(inputData: String)
    func setPasswordConfirm(inputData: String)
    func register()
}

class RegisterViewModel: RegisterViewModelProtocol {
    var username: String?
    var email: String?
    var password: String?
    var passwordConfirm: String?
    
    func setUsername(inputData: String) {
        username = inputData
    }
    
    func setEmail(inputData: String) {
        email = inputData
    }
    
    func setPassword(inputData: String) {
        password = inputData
    }
    
    func setPasswordConfirm(inputData: String) {
        passwordConfirm = inputData
    }
    
    
    private let apiService: APIService
    private let endpoint = "/api/register"
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func register() {
        guard let email = email, let username = username, let password = password, let passwordConfirm = passwordConfirm else {
            print("One or more required fields are empty")
            return
        }
        
        let user = Registration(username: username, email: email, password: password, password_confirm: passwordConfirm)
        apiService.post(endpoint: endpoint, data: user) { (result) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}

//
//protocol RegisterViewModelProtocol {
//    func register(user: Registration)
//}
//
//class RegisterViewModel: RegisterViewModelProtocol {
//    
//    private let apiService: APIService
//    private let endpoint = "/api/register"
//    
//    init(apiService: APIService = APIService()) {
//        self.apiService = apiService
//    }
//    
//    func register(user: Registration) {
//        apiService.post(endpoint: endpoint, data: user) { (result) in
//            switch result {
//            case .success(_):
//                print("success")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
