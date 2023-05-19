import UIKit
import SnapKit

class InstructionCell: UITableViewCell {
    
    private lazy var verticalView: UIStackView = {
        let vv = UIStackView()
        vv.axis = .vertical
        vv.spacing = 40
        return vv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .monospacedSystemFont(ofSize: 20, weight: .light)
        label.text = "Это - ваше будущее приложение. \nДля просмотра списка шаблонов нажмите на иконку экрана снизу и выберите желаемый. \nДля изменения шаблона также нажмите иконку соответствующего экрана"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(verticalView)
        
        verticalView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.left.right.bottom.equalToSuperview().inset(40)
        }
        
        [titleLabel, instructionLabel].forEach({verticalView.addArrangedSubview($0)})
    }
}
