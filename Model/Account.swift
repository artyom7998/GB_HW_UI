//
//  Account.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 16.01.2021.
//

import Foundation

class Account {
         
    private init() {
        self.token = ""
        self.userId = 0
    }
    
    public static let shared = Account()
    
    var token: String
    var userId: Int
    
}
