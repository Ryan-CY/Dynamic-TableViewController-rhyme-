//
//  rhymeTableViewController.swift
//  TableView Practice(rhyme)
//
//  Created by Ryan Lin on 2023/2/3.
//

import UIKit
import SafariServices

class rhymeTableViewController: UITableViewController {
    //產生屬性 array sorts，類別是 Sorts，結合 computed property 去產生資料
    var sorts: [Sort] {
        
        let cocomelon1 = Rhyme(title: "Ants Go Marching Dance", intro: "Dance Party", photoName: "coco1", website: "https://www.youtube.com/watch?v=Ivi9n3EF3Es")
        let cocomelon2 = Rhyme(title: "Balloon Boat Race", intro: "CoComelon Nursery Rhymes & Kids Songs", photoName: "coco2", website: "https://www.youtube.com/watch?v=mgNIhdGyjx4")
        let cocomelon3 = Rhyme(title: "Go Before You Go Song", intro: "More Nursery Rhymes & Kids Songs", photoName: "coco3", website: "https://www.youtube.com/watch?v=dfRBIE3AE34")
        let cocomelon = Sort(name: "Cocomelon - Nursery Rhymes", rhyme: [cocomelon1, cocomelon2, cocomelon3])
        
        
        let carlsCarWash1 = Rhyme(title: "Red Light, Green Light", intro: "Song for Kids", photoName: "carl1", website: "https://www.youtube.com/watch?v=Y7QM_H0P4Q8")
        let carlsCarWash2 = Rhyme(title: "10 Little Fire Trucks", intro: "Song for Kids", photoName: "carl2", website: "https://www.youtube.com/watch?v=qdBBHuvxA2w")
        let carlsCarWash3 = Rhyme(title: "The Wheels On The Bus", intro: "Song for Kids", photoName: "carl3", website: "https://www.youtube.com/watch?v=aLKyrCN9dSs")
        let carlsCarWash4 = Rhyme(title: "Big Fruit Truck", intro: "Carl's Car Wash", photoName: "carl4", website: "https://www.youtube.com/watch?v=T4nr7WmKiwA")
        let carlscarwash = Sort(name: "Carl's Car Wash", rhyme: [carlsCarWash1, carlsCarWash2, carlsCarWash3, carlsCarWash4])
        
        
        let streamOfPraise1 = Rhyme(title: "雲上太陽", intro: "Sun Above the Clouds", photoName: "praise1", website: "https://www.youtube.com/watch?v=L8ff6bW5jXA")
        let streamOfPraise2 = Rhyme(title: "我要向高山舉目", intro: "Lift My Eyes to the Hills", photoName: "praise2", website: "https://www.youtube.com/watch?v=UKeYsyucUKc")
        let streamOfPraise = Sort(name: "Stream Of Praise Kids", rhyme: [streamOfPraise1, streamOfPraise2])
        
        return [cocomelon, carlscarwash, streamOfPraise]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 134
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sorts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //把 array sorts 對應 section，然後存入常數 sort
        let sort = sorts[section]
        //從 sort 讀取屬性 rhyme，回傳 rhyme 的數目
        return sort.rhyme.count
    }
    
    fileprivate func configuration(_ cell: ListTableViewCell) {
        
        cell.photoImageView.frame = CGRect(x: 5, y: 7, width: 200, height: 120)
        cell.photoImageView.contentMode = .scaleAspectFill
        cell.photoImageView.layer.cornerRadius = 7
        cell.photoImageView.layer.borderWidth = 1.5
        cell.photoImageView.layer.borderColor = UIColor.systemMint.cgColor
        
        cell.titleLabel.frame = CGRect(x: 209, y: 35, width: 175, height: 40)
        cell.titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        cell.titleLabel.baselineAdjustment = .alignBaselines
        cell.titleLabel.textColor = .systemCyan
        cell.titleLabel.numberOfLines = 0
        
        cell.introLabel.frame = CGRect(x: 209, y: 60, width: 175, height: 45)
        cell.introLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        cell.introLabel.textColor = .systemGray3
        cell.introLabel.numberOfLines = 0
        
        cell.backgroundColor = .systemGray6
    }
    
    fileprivate func chineseConfiguration(_ cell: ChineseSongTableViewCell) {
        
        cell.picImageView.frame = CGRect(x: 185, y: 7, width: 200, height: 120)
        cell.picImageView.contentMode = .scaleAspectFill
        cell.picImageView.layer.cornerRadius = 7
        cell.picImageView.layer.borderWidth = 1.5
        cell.picImageView.layer.borderColor = UIColor.systemYellow.cgColor
        
        cell.nameLabel.frame = CGRect(x: 5, y: 35, width: 175, height: 40)
        cell.nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        cell.nameLabel.baselineAdjustment = .alignBaselines
        cell.nameLabel.textColor = .systemYellow
        cell.nameLabel.numberOfLines = 0
        
        cell.albumLabel.frame = CGRect(x: 5, y: 60, width: 175, height: 45)
        cell.albumLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        cell.albumLabel.textColor = .systemGray4
        cell.albumLabel.numberOfLines = 0
        
        cell.backgroundColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //原則上為減少字串輸入的錯誤，盡可能用程式的表達方式達到等同字串的意思
        if sorts[indexPath.section].name == "\(sorts[2].name)" {
            //把cell轉型成自創型別
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChineseSongTableViewCell.self)", for: indexPath) as! ChineseSongTableViewCell
            //讓 array sorts 對應 section， array rhymes 對應 row
            let sort = sorts[indexPath.section]
            let song = sort.rhyme[indexPath.row]
            
            cell.picImageView.image = UIImage(named: song.photoName)
            cell.nameLabel.text = song.title
            cell.albumLabel.text = song.intro
            
            chineseConfiguration(cell)
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ListTableViewCell.self)", for: indexPath) as! ListTableViewCell
            
            let sort = sorts[indexPath.section]
            let song = sort.rhyme[indexPath.row]
            
            cell.photoImageView.image = UIImage(named: song.photoName)
            cell.titleLabel.text = song.title
            cell.introLabel.text = song.intro
            
            configuration(cell)
            
            return cell
            
        }
    }
    //在 Header 顯示 sorts array 的 name
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sorts[section].name
    }
    //點選 cell 傳入下一頁開啟 YouTube 網頁
    //方法1 利用 function didSelectRowAt 搭配 present 由程式產生 SFSafariViewController
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let sort = sorts[indexPath.section]
//            //把點選的 row 對應的字串 website 存入常數 song
//            let song = sort.rhyme[indexPath.row].website
//            let url = URL(string: song)
//            let safari = SFSafariViewController(url: url!)
//            present(safari, animated: true)
//        }
//    }
    
    //方法2 拉 IBSegueAction，搭配 guard let 連到下一頁
    @IBSegueAction func showWeb(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> SafariViewController? {
        
        guard let indexPath = tableView.indexPathForSelectedRow else {return nil}
        let sort = sorts[indexPath.section]
        let website = sort.rhyme[indexPath.row].website
        
        return SafariViewController(coder: coder, website: website)
    }
}
