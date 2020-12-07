//
//  User.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 07/12/2020.
//


public struct UserCompany: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}

public struct Geo: Decodable {
    let lat: String
    let lng: String
}

public struct UserAddress: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

public struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
    let phone: String
    let website: String
    let company: UserCompany
}
