//
//  RealmServices.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 02.02.2021.
//

import Foundation
import RealmSwift

class RealmService {
   
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    func save <T: Object>(items: [T],
                                 configuration: Realm.Configuration = deleteIfMigration,
                                 update: Realm.UpdatePolicy = .modified) throws {
        
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write{
            realm.add(items, update: update)
        }
    }
    
    func load <T: Object>(_: T) -> [T] {
            do {
                let realm = try Realm()
                let objects = realm.objects(T.self)
                return Array(objects)
            } catch {
                print(error)
                return [T]()
            }
    }

}
