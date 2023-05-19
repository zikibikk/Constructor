//
//  EmployeePresenter.swift
//  Constructor
//
//  Created by Alina Bikkinina on 16.05.2023.
//

import Foundation

protocol IEmployeeService {
    func getEmployees(_ closure: ([EmployeeModel])->())
}

class EmployeeService: IEmployeeService {
    
    func getEmployees(_ closure: ([EmployeeModel])->()) {
        closure([.init(avatar: nil, name: "Алина Биккинина", position: "iOS разработчик"),
                 .init(avatar: nil, name: "Семён Петров", position: "java разработчик"),
                 .init(avatar: nil, name: "Лазарь Семёнов", position: "Уборщик")])
    }
}

class EmployeePresenter: EmployeeOutput {
    
    var sample = Samples.employeSample
    
    weak var employeeViewController: EmployeeInput?
    
    private let employeeService: IEmployeeService
    
    init(employeeService: IEmployeeService) {
        self.employeeService = employeeService
    }
    
    func viewWillAppear() {
        employeeService.getEmployees({
            employeeViewController?.show(employeeModels: $0)
        })
    }
}
