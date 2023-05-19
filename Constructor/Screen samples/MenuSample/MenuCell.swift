import UIKit

struct MenuModel {
    var image: UIImage?
    let food: String
    let components: String
}

class MenuCell: UITableViewCell {
    
    private lazy var foodImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "carrot.fill"))
        iv.tintColor = .systemOrange
        return iv
    }()
    
    private lazy var foodLabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var componentsLabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuCell {
    
    private func setUpView() {
        
        self.selectionStyle = .none

        self.contentView.addSubview(foodImageView)
        self.contentView.addSubview(foodLabel)
        self.contentView.addSubview(componentsLabel)
        
        foodImageView.snp.makeConstraints { make in
            make.left
                .top
                .bottom
                .equalToSuperview().inset(15)
            make.height
                .width
                .equalTo(130)
        }
        
        foodLabel.snp.makeConstraints { make in
            make.top.equalTo(foodImageView)
            make.left.equalTo(foodImageView.snp_rightMargin).offset(15)
            make.right.equalToSuperview().inset(15)
        }
        
        componentsLabel.snp.makeConstraints { make in
            make.top.equalTo(foodLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(foodImageView.snp_rightMargin).offset(15)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    func setContent(model: MenuModel) {
        if let image = model.image {
            foodImageView.image = image
            foodImageView.tintColor = .newsColor
        }
        foodLabel.text = model.food
        componentsLabel.text = model.components
    }
}
