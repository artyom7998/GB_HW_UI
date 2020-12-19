//
//  NewsTableViewCell.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.12.2020.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var publisherImage: AvatarImage!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var publicationDate: UILabel!
    @IBOutlet weak var publicationText: UITextView!
    @IBOutlet weak var publicationImage: UIImageView!
    @IBOutlet weak var likeConrol: ImLikeIt!
    
}
