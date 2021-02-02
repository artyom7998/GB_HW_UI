//
//  Groups.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.01.2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class GroupData: Object {

    @objc dynamic var id = 0 // идентификатор сообщества
    @objc dynamic var name = "" // название сообщества
    @objc dynamic var deactivated = "" // возвращается в случае, если сообщество удалено или заблокировано. Возможные значения:deleted — сообщество удаленоbanned — сообщество заблокировано;
    @objc dynamic var type = "" // тип сообщества: group — группа; page — публичная страница; event — мероприятие.
    @objc dynamic var photo_url = "" // URL главной фотографии с размером 50x50px.
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.deactivated = json["deactivated"].stringValue
        self.type = json["type"].stringValue
        self.photo_url = json["photo_50"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
