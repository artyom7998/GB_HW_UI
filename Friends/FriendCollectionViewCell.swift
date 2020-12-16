//
//  FriendCollectionViewCell.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var photoLikeControl: ImLikeIt!
}
