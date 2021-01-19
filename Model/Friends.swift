//
//  Friends.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.01.2021.
//

import Foundation
import SwiftyJSON

struct FriendData {

    let id: Int // идентификатор пользователя
    let name: String // имя пользователя
    let deactivated: String
    let is_closed: Bool
    let city: String
    let online: Int
    let photo_url: String
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["first_name"].stringValue + " " + json["last_name"].stringValue
        self.deactivated = json["deactivated"].stringValue
        self.is_closed = json["is_closed"].boolValue
        self.city = json["city"]["title"].stringValue
        self.online = json["online"].intValue
        self.photo_url = json["photo_100"].stringValue
    }
}
