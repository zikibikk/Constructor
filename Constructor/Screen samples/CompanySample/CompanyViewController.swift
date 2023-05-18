//
//  CompanyViewController.swift
//  Constructor
//
//  Created by Alina Bikkinina on 16.05.2023.
//

import UIKit

class CompanyViewController: UIViewController {
    
    private lazy var companyPhoto: UIImageView = UIImageView(image: .init(systemName: "person.fill"))
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var companyInfo: UITextField = UITextField()
    
    
}
