import UIKit
import SnapKit

private enum Constraints: ConstraintInsetTarget {
    static let superEdges = 15
    static let elementSpacing = 15
}

struct EmployeeModel {
    var avatar: UIImage?
    let name: String
    let position: String
}

class EmployeeCell: UITableViewCell {
    
    private lazy var avatarImageView = UIImageView(image: .init(systemName: "person.fill"))
    
    private lazy var nameLabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var positionLabel = {
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
    
    private func setUpView(){
        self.selectionStyle = .none

        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(positionLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.height
                .width.equalTo(200)
            make.right
                .top
                .bottom
                .equalToSuperview().inset(Constraints.superEdges)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.right.equalTo(avatarImageView.snp_leftMargin).offset(Constraints.elementSpacing)
            make.top
                .left
                .equalToSuperview().inset(30)
        }
        
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(Constraints.elementSpacing)
            make.left.equalTo(nameLabel).inset(Constraints.superEdges)
        }
        
    }
    
    func setContent(model: EmployeeModel) {
        if let image = model.avatar { avatarImageView.image = image }
        nameLabel.text = model.name
        positionLabel.text = model.position
    }
}

