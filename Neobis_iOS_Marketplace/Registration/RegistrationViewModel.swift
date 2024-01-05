//
//  RegistrationViewModel.swift
//  Neobis_iOS_Marketplace
//

import Foundation

protocol RegisterViewModelProtocol {
    func register(user: RegisterDto)
}

class RegisterViewModel: RegisterViewModelProtocol {
    
    private let apiService: APIService
    private let endpoint = "/api/register"
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func register(user: RegisterDto) {
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