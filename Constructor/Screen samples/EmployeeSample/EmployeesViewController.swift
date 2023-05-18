import UIKit
//при долгом нажатии сделать редактиривание ячейки

class EmployeesViewController: UIViewController {
    
    private let presenter: EmployeeOutput
    private var employeeModels: [EmployeeModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "\(EmployeeCell.self)")
        return tableView
    }()
    
    init(presenter: EmployeeOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(systemName: "person.3.fill")
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

extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as! EmployeeCell
        cell.setContent(model: employeeModels[indexPath.row])
        return cell
    }
}

extension EmployeesViewController: UITableViewDelegate {}

extension EmployeesViewController: EmployeeInput {
    func show(employeeModels: [EmployeeModel]) {
        self.employeeModels = employeeModels
    }
    
}
