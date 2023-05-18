import UIKit

protocol EmployeeOutput: AnyObject, ViewOutput {
    func viewWillAppear()
}

protocol EmployeeInput: UIViewController {
    func show(employeeModels: [EmployeeModel])
}
