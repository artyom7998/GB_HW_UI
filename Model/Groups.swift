//
//  Groups.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.01.2021.
//

import Foundation
import SwiftyJSON

struct GroupData {

    let id: Int // идентификатор сообщества
    let name: String // название сообщества
    let deactivated: String // возвращается в случае, если сообщество удалено или заблокировано. Возможные значения:deleted — сообщество удаленоbanned — сообщество заблокировано;
    let type: String // тип сообщества: group — группа; page — публичная страница; event — мероприятие.
    let photo_url: String // URL главной фотографии с размером 50x50px.
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.deactivated = json["deactivated"].stringValue
        self.type = json["type"].stringValue
        self.photo_url = json["photo_50"].stringValue
    }
}
