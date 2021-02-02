//
//  FrinendsTableViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit

class FrinendsTableViewController: UITableViewController {
    
    private let networkServices = NetworkServices()
    private let realmService = RealmService()
    
    private var friends = [FriendData]() {
        didSet {
            (firstLetters, sortedFriends) = sort(friends)
            tableView.reloadData()
        }
    }
    
    private var firstLetters = [Character]()
    private var sortedFriends = [Character: [FriendData]]()

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServices.getFriends { [self] friendsResponse in
            
            do {
                try realmService.save(items: friendsResponse)
            } catch {
                print(error)
            }
            
            self.friends = realmService.load(FriendData())
        }
        
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
        if let friends = sortedFriends[fristLetter] {
            cell.configure(with: friends[indexPath.row])
            
            /*
            cell.name.text = userData[indexPath.row].name
            cell.city.text = userData[indexPath.row].city
            cell.avatarImage.photoImage.image = userData[indexPath.row].image
            */
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
        destination.userId = friends?[indexPath.row].id
    }
    
    private func sort( _ friends: [FriendData]) -> (characters: [Character], sortedFriends: [Character: [FriendData]]) {
        
        var characters = [Character]()
        var sortedFriends = [Character: [FriendData]]()
        
        friends.forEach { userData in
            
            guard let character = userData.name.first else { return }
            
            if var thisCharUsers = sortedFriends[character] {
                thisCharUsers.append(userData)
                sortedFriends[character] = thisCharUsers
            } else {
                sortedFriends[character] = [userData]
                characters.append(character)
            }
            
            //characters.sort()
        }
        
        characters.sort()
        
        if friends.count > 5 {
            
            var topFriends = [FriendData]()
            
            for (index, value) in friends.enumerated() {
                topFriends.append(value)
                if index == 4 { break }
            }
            
            let topCharacter = Character("★")
            
            var characterAppend = [Character]()
            characterAppend.append(topCharacter)
            characters = characterAppend + characters
            
            sortedFriends[topCharacter] = topFriends
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
            (firstLetters, sortedFriends) = sort(friends)
            tableView.reloadData()
            return
        }
        
        let filteredFriends = friends.filter({ (userData) -> Bool in
            return userData.name.lowercased().contains(text.lowercased())
        })
        
        (firstLetters, sortedFriends) = sort(filteredFriends)
        tableView.reloadData()
        
    }
}
