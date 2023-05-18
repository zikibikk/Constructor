import UIKit

class EmployeeAssembly {
    
    static func assemble() -> UIViewController {
        
        let employeeService: IEmployeeService = EmployeeService()
        
        let presenter = EmployeePresenter(employeeService: employeeService)
        
        let employeeViewController: EmployeeInput = EmployeesViewController(presenter: presenter)
        
        presenter.employeeViewController = employeeViewController
        
        return employeeViewController
    }
}
