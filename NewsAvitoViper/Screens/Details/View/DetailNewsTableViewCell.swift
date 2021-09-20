//
//  DetailNewsTableViewCell.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import UIKit
import Kingfisher

class DetailNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var contentNews: UILabel!
  
    
    var newsURL: String = ""
    
    func setup(_ news: Article) {
        self.contentNews.text = news.description
        
        imgNews.kf.indicatorType = .activity
        
        imgNews.kf.setImage(
            with: URL(string: news.urlToImage ?? "")
        )
        
        self.newsURL = news.url ?? ""
        
    }
    
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
