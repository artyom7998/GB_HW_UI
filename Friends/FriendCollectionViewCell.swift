//
//  FriendCollectionViewCell.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 09.12.2020.
//

import UIKit
import Kingfisher

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var photoLikeControl: ImLikeIt!
    
    override func prepareForReuse() {
        super.prepareForReuse()

        image.image = nil
        photoLikeControl.countLikes = 0
    }
    
    func configure(with photoData: PhotoData) {
        
        photoLikeControl.countLikes = photoData.countLikes
        photoLikeControl.isLiked = photoData.userLikes
        
        let url = URL(string: photoData.photo_url)
        image.kf.setImage(with: url)

    }
}
