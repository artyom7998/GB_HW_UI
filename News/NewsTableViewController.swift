//
//  NewsTableViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 19.12.2020.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news = [NewsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "PublicationCell")
        
      //  tableView.register(NewsTableViewSectionHeader.self, forHeaderFooterViewReuseIdentifier: "NewsTableViewSectionHeader")
        
        tableView.register(UINib(nibName: "NewsTableViewSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "NewsTableViewSectionHeader")
        
        tableView.register(UINib(nibName: "NewsTableSectionFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "NewsTableSectionFooter")
    
        fillArrayTestNews(&news)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countCellInSectionForNews(news[section])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let newsData = news[indexPath.section]
    
        switch (indexPath.row, newsData.publicationText != nil, newsData.publicationImage != nil) {
        case (0, true, _):
            return prepareTextCell(newsData, indexPath)
        case (0, _, true):
            return prepareImagePublicationCell(newsData, indexPath)
        case (1, _, true):
            return prepareImagePublicationCell(newsData, indexPath)
        default:
            return UITableViewCell()
        }
        
        /*

        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "PublicationCell", for: indexPath) as? NewsTableViewCell
        else {
             return UITableViewCell()
        }
        
        cell.publisherImage.photoImage.image = news[indexPath.row].publisherImage
        cell.publisherName.text = news[indexPath.row].publisherName
        cell.publicationDate.text = news[indexPath.row].publicationDateForShow
        cell.publicationText.text = news[indexPath.row].publicationText
        cell.publicationImage.image = news[indexPath.row].publicationImage
        cell.likeConrol.countLikes = news[indexPath.row].countLikes
        cell.likeConrol.isLiked = news[indexPath.row].isLike

        return cell
         */
    }
    
    func prepareTextCell(_ newsData: NewsData, _ indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextNewsCell", for: indexPath) as? NewsTextTableViewCell
        else {
             return UITableViewCell()
        }
        
        cell.publicationText.text = newsData.publicationText
        
        return cell
        
    }
    
    func heightForView(text:String, font:UIFont, width: CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func prepareImagePublicationCell(_ newsData: NewsData, _ indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "PublicationImageCell", for: indexPath) as? NewsImagePublicationCell
        else {
             return UITableViewCell()
        }
        
        cell.publicationImage.image = newsData.publicationImage
        
        let ratio = cell.publicationImage.image!.size.width / cell.publicationImage.image!.size.height
        let newHeight = cell.publicationImage.frame.width / ratio
        cell.constraintHeight.constant = newHeight
        
        return cell
        
    }
    
    func calcHeightForImage(_ imageView: UIImageView) -> CGSize {
        
        guard let myImage = imageView.image else {
            return CGSize(width: -1.0, height: -1.0)
        }
        
        let myImageWidth = myImage.size.width
        let myImageHeight = myImage.size.height
        let myViewWidth = imageView.frame.size.width

        let ratio = myViewWidth/myImageWidth
        let scaledHeight = myImageHeight * ratio

        return CGSize(width: myViewWidth, height: scaledHeight)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    */
    
    func countCellInSectionForNews(_ news: NewsData) -> Int {
        
        var count = 0
        
        if news.publicationImage != nil {
            count += 1
        }
        
        if news.publicationText != nil {
            count += 1
        }
        
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        55
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableViewSectionHeader") as? NewsTableViewSectionHeader,
            countCellInSectionForNews(news[section]) > 0 // если в новости нет данных для вывода, то не будем выводить полностью секцию
        else { return nil }
        
        sectionHeader.image.photoImage.image = news[section].publisherImage
        sectionHeader.publicationDate.text = news[section].publicationDateForShow
        sectionHeader.publisher.text = news[section].publisherName
        
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        guard
            let sectionFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableSectionFooter") as? NewsTableSectionFooter,
            countCellInSectionForNews(news[section]) > 0 // если в новости нет данных для вывода, то не будем выводить полностью секцию
        else { return nil }
        sectionFooter.likeControl.countLikes = news[section].countLikes
        sectionFooter.likeControl.isLiked = news[section].isLike
        
        return sectionFooter
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
