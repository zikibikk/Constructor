import UIKit

protocol ViewOutput {
    var sample: Samples { get }
    func viewWillAppear()
}

class ChangableViewController: UIViewController {
    
    private var employeeModels: [EmployeeModel] = []
    private var menuModels: [MenuModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "\(EmployeeCell.self)")
        tableView.register(MenuCell.self, forCellReuseIdentifier: "\(MenuCell.self)")
        return tableView
    }()
    
    var presenter: ViewOutput?
    private var currentSample: Samples?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(systemName: "book")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
}

extension ChangableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentSample {
        case .employeSample:
            return employeeModels.count
            
        case .menuSample:
            return menuModels.count
            
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch currentSample {
        case .employeSample:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as! EmployeeCell
            cell.setContent(model: employeeModels[indexPath.row])
            return cell
            
        case .menuSample:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuCell.self)", for: indexPath) as! MenuCell
            cell.setContent(model: menuModels[indexPath.row])
            return cell
        case .none:
            return UITableViewCell()
        }
    }
}

extension ChangableViewController: EmployeeInput {
    func show(employeeModels: [EmployeeModel]) {
        currentSample = .employeSample
        self.employeeModels = employeeModels
        self.tabBarItem.image = UIImage(systemName: "person.3.fill")
        tableView.reloadData()
    }
}

extension ChangableViewController: MenuInput {
    func show(menuModels: [MenuModel]) {
        currentSample = .menuSample
        self.menuModels = menuModels
        self.tabBarItem.image = UIImage(systemName: "fork.knife")
        tableView.reloadData()
    }
}
