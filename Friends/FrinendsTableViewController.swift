//
//  FrinendsTableViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit

class FrinendsTableViewController: UITableViewController {
  
    
    var myFriends = [
        UserData("Иванов Иван", "Москва", UIImage(systemName: "person.crop.circle")!),
        UserData("Петров Петр", "Санкт Петербург", UIImage(systemName: "rectangle.stack.person.crop")!)]

    /* Вопрос. У меня получему то не получилось инециализировать пустой массив, а потом добавить в него структуру. Что здесь не так?
    var friend1 = UserData("Иванов Иван", "Москва", UIImage(systemName: "person.crop.circle")!)
    var myFriends = [UserData]()
    myFriends.append(friend1)
    */

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFriends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell
        else {
             return UITableViewCell()
        }
        
        cell.friendName.text = myFriends[indexPath.row].name
        cell.friendCity.text = myFriends[indexPath.row].city
        cell.imageView?.image = myFriends[indexPath.row].image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //present(FriendCollectionViewController)
        //tableView.deselectRow(at: indexPath, animated: true)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            segue.identifier == "ShowDetailDataFriend",
            let destination = segue.destination as? FriendCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        
        destination.userIndex = index
        destination.name = myFriends[index].name
        destination.city = myFriends[index].city
        destination.image = myFriends[index].image
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
