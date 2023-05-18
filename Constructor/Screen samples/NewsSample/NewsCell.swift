//
//  NewsCell.swift
//  Constructor
//
//  Created by Alina Bikkinina on 17.05.2023.
//

import UIKit

struct NewsModel {
    
    var image: UIImage?
    
    let title: String
    let time: String
    let description: String
}

class NewsCell: UITableViewCell {
    func setContent(model: NewsModel) {}
}
