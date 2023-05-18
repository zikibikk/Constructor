//
//  NewsViewController.swift
//  Constructor
//
//  Created by Alina Bikkinina on 17.05.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let presenter: NewsOutput
    
    private var newsModels: [NewsModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(NewsCell.self, forCellReuseIdentifier: "\(NewsCell.self)")
        return tableView
    }()
    
    init(presenter: NewsOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}


extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.self)", for: indexPath) as! NewsCell
        cell.setContent(model: newsModels[indexPath.row])
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {}

extension NewsViewController: NewsInput {
    func show(newsModels: [NewsModel]) {
        self.newsModels = newsModels
    }
}

