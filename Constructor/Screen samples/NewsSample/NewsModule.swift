//
//  NewsModule.swift
//  Constructor
//
//  Created by Alina Bikkinina on 17.05.2023.
//

import UIKit

protocol NewsInput: UIViewController { func show(newsModels: [NewsModel]) }
protocol NewsOutput: ViewOutput { func viewWillAppear() }
