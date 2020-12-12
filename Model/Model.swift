//
//  Model.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 12.12.2020.
//

import UIKit

public struct UserData {
    var name: String
    var city: String
    var image: UIImage
    
    init(_ name: String, _ city: String, _ image: UIImage) {
        self.name = name
        self.city = city
        self.image = image
    }
}

public struct GroupData: Equatable {
    var name: String
    var image: UIImage
    
    init(_ name: String, _ image: UIImage) {
        self.name = name
        self.image = image
    }
}
