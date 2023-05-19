import UIKit

protocol ViewOutput {
    var sample: Samples { get }
    func viewWillAppear()
}

protocol ChangableViewInput: UIViewController, MenuInput, EmployeeInput, NewsInput {
    func changeSample(newSample: Samples)
    func changePresenter(newPresenter: ViewOutput?)
}

class ChangableViewController: UIViewController {
    
    private var employeeModels: [EmployeeModel] = []
    private var menuModels: [MenuModel] = []
    private var newsModels: [NewsModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(InstructionCell.self, forCellReuseIdentifier: "\(InstructionCell.self)")
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "\(EmployeeCell.self)")
        tableView.register(MenuCell.self, forCellReuseIdentifier: "\(MenuCell.self)")
        tableView.register(NewsCell.self, forCellReuseIdentifier: "\(NewsCell.self)")
        tableView.register(NewsWithImageCell.self, forCellReuseIdentifier: "\(NewsWithImageCell.self)")
        return tableView
    }()
    
    var presenter: ViewOutput?
    var currentSample: Samples?
    
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
            
        case .newsSample:
            return newsModels.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch currentSample {
            
        case .instruction:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(InstructionCell.self)", for: indexPath) as! InstructionCell
            return cell
            
        case .employeSample:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as! EmployeeCell
            cell.setContent(model: employeeModels[indexPath.row])
            return cell
            
        case .menuSample:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuCell.self)", for: indexPath) as! MenuCell
            cell.setContent(model: menuModels[indexPath.row])
            return cell
            
        case .newsSample:
            let currentModel = newsModels[indexPath.row]
            if currentModel.image != nil {
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsWithImageCell.self)", for: indexPath) as! NewsWithImageCell
                cell.setContent(model: newsModels[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.self)", for: indexPath) as! NewsCell
                cell.setContent(model: newsModels[indexPath.row])
                return cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(InstructionCell.self)", for: indexPath) as! InstructionCell
            return cell
        }
    }
}

extension ChangableViewController {
    func reloadData() {
        tableView.reloadData()
    }
}

extension ChangableViewController: ChangableViewInput {
    
    func changeSample(newSample: Samples) {
        self.currentSample = newSample
        tableView.reloadData()
    }
    
    func changePresenter(newPresenter: ViewOutput?) {
        self.presenter = newPresenter
    }
}

extension ChangableViewController: EmployeeInput {
    func show(employeeModels: [EmployeeModel]) {
        currentSample = .employeSample
        self.employeeModels = employeeModels
        tableView.reloadData()
    }
}

extension ChangableViewController: MenuInput {
    func show(menuModels: [MenuModel]) {
        currentSample = .menuSample
        self.menuModels = menuModels
        tableView.reloadData()
    }
}

extension ChangableViewController: NewsInput {
    func show(newsModels: [NewsModel]) {
        currentSample = .newsSample
        self.newsModels = newsModels
        tableView.reloadData()
    }
}
