//
//  FriendTableViewCell.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {
    
    private var id: Int!

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var avatarImage: AvatarImage?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        name.text = nil
        city.text = nil
        avatarImage?.photoImage.image = nil
        
    }
    
    func configure(with friendData: FriendData) {
        
        id = friendData.id
        
        name.text = friendData.name
        city.text = friendData.city
        
        let url = URL(string: friendData.photo_url)
        avatarImage?.photoImage.kf.setImage(with: url)
    }
}
