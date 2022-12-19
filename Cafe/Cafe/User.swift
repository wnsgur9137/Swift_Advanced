//
//  User.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/19.
//

import Foundation

struct User {
    let username: String
    let account: String
    
    static let shared = User(username: "준혁", account: "fast.campus")
}
