//
//  Model.swift
//  Neobis_iOS_Marketplace
//
import Foundation

struct Registration: Codable {
    let username: String
    let email: String
    let password: String
    let password_confirm: String
}
