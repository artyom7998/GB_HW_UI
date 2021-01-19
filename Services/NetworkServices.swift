//
//  NetworkService.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 18.01.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkServices {
    
    let url = "https://api.vk.com"
    let versionApi = "5.126"
    
    func getFriends(completionHandler: @escaping ([FriendData]) -> Void) {
        
        let uri = url + "/method/friends.get"
        
        let parameters: Parameters = [
            "access_token": Account.shared.token,
            "v": versionApi,
            "order": "hints",
            "count": 5000,
            "fields": "city,photo_100,online"
        ]
        
        AF
            .request(uri, method: .get, parameters: parameters)
            .responseData { response in
            
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let responseData = json["response"].dictionaryValue
                    let items = responseData["items"]?.arrayValue
                    var friends = items?.compactMap { FriendData($0) } ?? [FriendData]()
                    
                    friends = friends.filter { $0.deactivated == ""} // Только активные профили
                    
                    completionHandler(friends)
                    
                case .failure(let error):
                    print(error)
                    completionHandler([FriendData]())
                }
        }
    }
    
    func getAllPhotos(_ owner_id: Int, completionHandler: @escaping ([PhotoData]) -> Void) {
        
        let uri = url + "/method/photos.getAll"
        
        let parameters: Parameters = [
            "access_token": Account.shared.token,
            "owner_id": owner_id,
            "v": versionApi,
            "photo_sizes": "1",
            "extended": "1",
            "count": "200",
        ]
        AF
            .request(uri, method: .get, parameters: parameters)
            .responseData { response in
            
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let responseData = json["response"].dictionaryValue
                    let items = responseData["items"]?.arrayValue
                    let photos = items?.compactMap { PhotoData($0) } ?? [PhotoData]()
                    
                    completionHandler(photos)
                    
                case .failure(let error):
                    print(error)
                    completionHandler([PhotoData]())
                }
        }
    }
    
    func getGroups(completionHandler: @escaping ([GroupData]) -> Void) {
        
        let uri = url + "/method/groups.get"
        
        let parameters: Parameters = [
            "access_token": Account.shared.token,
            "v": versionApi,
            "extended": "1"
        ]
        
        AF
            .request(uri, method: .get, parameters: parameters)
            .responseData { response in
            
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let responseData = json["response"].dictionaryValue
                    let items = responseData["items"]?.arrayValue
                    let groups = items?.compactMap { GroupData($0) } ?? [GroupData]()
                
                    completionHandler(groups)
                    
                case .failure(let error):
                    print(error)
                    completionHandler([GroupData]())
                }
        }
    }
    
    func searchGroups(_ name: String) {
        
        let uri = url + "/method/groups.search"
        
        let parameters: Parameters = [
            "access_token": Account.shared.token,
            "v": versionApi,
            "q": name,
        ]
        
        AF.request(uri,
                   method: .get,
                   parameters: parameters).responseJSON { (json) in
                    print(json)
                   }
    }
    
}
