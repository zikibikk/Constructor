import UIKit


class MenuViewController: UIViewController {
    
    private let presenter: MenuOutput
    private var menuModels: [MenuModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(MenuCell.self, forCellReuseIdentifier: "\(MenuCell.self)")
        return tableView
    }()
    
    init(presenter: MenuOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(systemName: "fork.knife")
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

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuCell.self)", for: indexPath) as! MenuCell
        cell.setContent(model: menuModels[indexPath.row])
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {}

extension MenuViewController: MenuInput {
    func show(menuModels: [MenuModel]) {
        self.menuModels = menuModels
    }
}
