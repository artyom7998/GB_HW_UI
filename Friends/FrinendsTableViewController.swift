//
//  FrinendsTableViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit

class FrinendsTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var myFriends =
        [
        UserData("Иванов Иван", "Москва", UIImage(named: "friend1")!, 100),
        UserData("Петров Петр", "Санкт Петербург", UIImage(named: "friend2")!, 200)
        ]
    
    var firstLetters = [Character]()
    var sortedFriends = [Character: [UserData]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (firstLetters, sortedFriends) = sort(myFriends)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstLetters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendsForLetter = firstLetters[section]
        return sortedFriends[friendsForLetter]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(firstLetters[section])
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell
        else {
             return UITableViewCell()
        }
        
        let fristLetter = firstLetters[indexPath.section]
        
        if let userData = sortedFriends[fristLetter] {
            cell.name.text = userData[indexPath.row].name
            cell.city.text = userData[indexPath.row].city
            cell.avatarImage.photoImage.image = userData[indexPath.row].image
        }
        
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
            let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let fristLetter = firstLetters[indexPath.section]
        let friends = sortedFriends[fristLetter]
        destination.userData = friends?[indexPath.row]
        
    }
    
    private func sort( _ friends: [UserData]) -> (characters: [Character], sortedFriends: [Character: [UserData]]) {
        
        var characters = [Character]()
        var sortedFriends = [Character: [UserData]]()
        
        friends.forEach { userData in
            
            guard let character = userData.name.first else { return }
            
            if var thisCharUsers = sortedFriends[character] {
                thisCharUsers.append(userData)
                sortedFriends[character] = thisCharUsers
            } else {
                sortedFriends[character] = [userData]
                characters.append(character)
            }
            characters.sort()
        }
        return (characters, sortedFriends)
    }
}

extension FrinendsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFrineds(with: searchText)
    }
    
    func filterFrineds(with text: String) {
        
        if text.isEmpty {
            (firstLetters, sortedFriends) = sort(myFriends)
            tableView.reloadData()
            return
        }
        
        let filteredFriends = myFriends.filter({ (userData) -> Bool in
            return userData.name.lowercased().contains(text.lowercased())
        })
        
        (firstLetters, sortedFriends) = sort(filteredFriends)
        tableView.reloadData()
        
    }
}
