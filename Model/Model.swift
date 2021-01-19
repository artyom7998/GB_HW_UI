//
//  Model.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 12.12.2020.
//

import UIKit

/*

public struct UserData {
    var name: String
    var city: String
    var image: UIImage?
    var countImageLikes: Int
    
    init(_ name: String, _ city: String, _ image: UIImage, _ countImageLikes: Int) {
        self.name = name
        self.city = city
        self.image = image
        self.countImageLikes = countImageLikes
    }
}

public struct GroupData: Equatable {
    var name: String
    var image: UIImage
    
    init(_ name: String, _ image: UIImage) {
        self.name = name
        self.image = image
    }
}
 
 */

public struct NewsData: Equatable {
   
    var publisherName: String
    var publisherImage: UIImage
    
    var publicationDateForShow: String
    var publicationText: String?
    var publicationImage: UIImage?
    var countLikes: Int
    var isLike: Bool
    
    init(_ publisherName: String, _ publisherImage: UIImage, _ publicationDate: Date, _ publicationText: String?, _ publicationImage: UIImage?, _ countLikes: Int, _ isLike: Bool) {
        self.publisherName = publisherName
        self.publisherImage = publisherImage
        self.publicationDateForShow = formatDateForShow(publicationDate)
        self.publicationText = publicationText
        self.publicationImage = publicationImage
        self.countLikes = countLikes
        self.isLike = isLike
    }
}

func fillArrayTestNews(_ news: inout [NewsData]) {
    
    let nowDate = NSDate() as Date
    
    for count in 1...10 {
        
        news.append(
            NewsData("Лучшие новости - " + String(count),
                     UIImage(named: "newsPublisher1")!,
                     nowDate,
                     "Apple представила M1 — первый процессор в линейке Apple Silicon. Это система на чипе (SoC), включающая восьмиядерные CPU и GPU, Neural Engine и другие составляющие.",
                     UIImage(named: "news1")!,
                     count,
                     count % 2 == 0))
    }

}

func formatDateForShow(_ dateForFormat: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"
        let date = formatter.string(from: dateForFormat as Date)
        return date
}
