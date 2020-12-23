//
//  NewsHeaderView.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 23.12.2020.
//

import UIKit

class NewsTableViewSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var image: AvatarImage!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var publicationDate: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //textLabel?.text = ""
    }

}
