//
//  GroupsTableViewCell.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 12.12.2020.
//

import UIKit
import Kingfisher

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        name.text = nil
        imageView?.image = nil
    }
    
    
    func configure(with groupData: GroupData) {
        
        name.text = groupData.name
        
        let url = URL(string: groupData.photo_url)
        imageView?.kf.setImage(with: url)
    }
    
    /*
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     */
    

}

