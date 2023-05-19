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
    
    fileprivate lazy var verticalView: UIStackView = {
        let vv = UIStackView()
        vv.axis = .vertical
        vv.spacing = 4
        return vv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .italicSystemFont(ofSize: 13)
        return label
    }()
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(verticalView)
        
        verticalView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        
        [titleLabel, dateLabel, newsTextLabel].forEach({verticalView.addArrangedSubview($0)})
    }
    
    func setContent(model: NewsModel) {
        titleLabel.text = model.title
        dateLabel.text = model.time
        newsTextLabel.text = model.description
    }
}


class NewsWithImageCell: NewsCell {
    private lazy var newsImageView = UIImageView()
    
    override func setUpView() {
        super.setUpView()
        
        newsImageView.snp.makeConstraints { make in
            make.height.width.equalTo(300)
        }
        
        verticalView.addArrangedSubview(newsImageView)
    }
    
    override func setContent(model: NewsModel) {
        super.setContent(model: model)
        self.newsImageView.image = model.image
        self.newsImageView.tintColor = .menuColor
    }
}
