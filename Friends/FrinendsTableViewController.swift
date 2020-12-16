//
//  FrinendsTableViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit

class FrinendsTableViewController: UITableViewController {
  
    
    var myFriends =
        [
        UserData("Иванов Иван", "Москва", UIImage(named: "friend1")!, 100),
        UserData("Петров Петр", "Санкт Петербург", UIImage(named: "friend2")!, 200)
        ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myFriends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell
        else {
             return UITableViewCell()
        }
        
        cell.name.text = myFriends[indexPath.row].name
        cell.city.text = myFriends[indexPath.row].city
        cell.avatarImage.photoImage.image = myFriends[indexPath.row].image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //present(FriendCollectionViewController)
        //tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            segue.identifier == "ShowDetailDataFriend",
            let destination = segue.destination as? FriendCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        
        destination.userData = myFriends[index]
        
    }
}
