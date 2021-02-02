//
//  Friends.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.01.2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class FriendData: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var deactivated = ""
    @objc dynamic var is_closed = false
    @objc dynamic var city = ""
    @objc dynamic var online = 0
    @objc dynamic var photo_url = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.name = json["first_name"].stringValue + " " + json["last_name"].stringValue
        self.deactivated = json["deactivated"].stringValue
        self.is_closed = json["is_closed"].boolValue
        self.city = json["city"]["title"].stringValue
        self.online = json["online"].intValue
        self.photo_url = json["photo_100"].stringValue
    }
}
