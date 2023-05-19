//
//  ChangeSampleViewController.swift
//  Constructor
//
//  Created by Alina Bikkinina on 18.05.2023.
//

import UIKit
import SnapKit

private enum Constraints: ConstraintInsetTarget {
    
    static let superEdges = 15
    static let elementSpacing = 20
    static let buttonsTop = 50
    static let buttonHeight = 70
}

enum Samples {
    case instruction
    case menuSample
    case employeSample
    case newsSample
}

protocol IChangePresenter {
    func instructionButtonPressed()
    func menuButtonPressed()
    func employeeButtonPressed()
    func newsButtonPressed()
}

class ChangeSampleViewController: UIViewController {
    
    private lazy var verticalView: UIStackView = {
        let vv = UIStackView()
        vv.axis = .vertical
        vv.spacing = 20
        return vv
    }()
    
    private lazy var instructionSampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Инструкция", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .instructionColor
        return button
    }()
    
    private lazy var menuSampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Шаблон меню", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .menuColor
        return button
    }()
    
    private lazy var employeeSampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Шаблон списка сотрудников", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .employeeColor
        return button
    }()
    
    private lazy var newsSampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Шаблон новостной ленты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .newsColor
        return button
    }()
    
    private lazy var companySampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Шаблон страницы компании", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .companyColor
        return button
    }()
    
    private lazy var instructionGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showInstructionSample(_:)))
    
    private lazy var menuGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMenuSample(_:)))
    
    private lazy var employeeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showEmployeeSample(_:)))
    
    private lazy var newsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showNewsSample(_:)))
    
    var presenter: IChangePresenter
    
    override func viewDidLoad() {
        setUp()
        super.viewDidLoad()
    }
    
    init(presenter: IChangePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChangeSampleViewController {
    
    func setUp() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(verticalView)
        
        [instructionSampleButton, menuSampleButton, employeeSampleButton, newsSampleButton, companySampleButton].forEach({$0.snp.makeConstraints { make in
            make.height.equalTo(Constraints.buttonHeight)
        }})
        
        verticalView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.superEdges)
            maker.top.equalToSuperview()
                .inset(Constraints.buttonsTop)
        }
        
        [instructionSampleButton, menuSampleButton, employeeSampleButton, newsSampleButton, companySampleButton].forEach({verticalView.addArrangedSubview($0)})
        
        
        instructionSampleButton.addGestureRecognizer(instructionGestureRecognizer)
        menuSampleButton.addGestureRecognizer(menuGestureRecognizer)
        employeeSampleButton.addGestureRecognizer(employeeGestureRecognizer)
        newsSampleButton.addGestureRecognizer(newsGestureRecognizer)
    }
    
}

extension ChangeSampleViewController {
    
    @objc func showInstructionSample(_ sender:UITapGestureRecognizer) {
        presenter.instructionButtonPressed()
    }
    
    @objc func showMenuSample(_ sender:UITapGestureRecognizer) {
        presenter.menuButtonPressed()
    }
    
    @objc func showEmployeeSample(_ sender:UITapGestureRecognizer) {
        presenter.employeeButtonPressed()
    }
    
    @objc func showNewsSample(_ sender:UITapGestureRecognizer) {
        presenter.newsButtonPressed()
    }
}
