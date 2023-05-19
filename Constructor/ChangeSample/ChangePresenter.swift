import UIKit

class ChangePresenter: IChangePresenter {
    
    weak var viewController: ChangableViewInput?
    
    private func buttonPressed(newPresenter: ViewOutput?, newSample: Samples, tabBarImageName: String, animated: Bool) {
        
        viewController?.changePresenter(newPresenter: newPresenter)
        
        viewController?.changeSample(newSample: newSample)
        
        newPresenter?.viewWillAppear()
        
        viewController?.tabBarItem.image = UIImage(systemName: tabBarImageName)
        
        viewController?.dismiss(animated: animated)
    }
    
    func instructionButtonPressed() {
        
        buttonPressed(newPresenter: nil, newSample: .instruction, tabBarImageName: "book", animated: true)
    }
    
    func menuButtonPressed() {
        
        let menuService: IMenuService = MenuService()
        let menuPresenter = MenuPresenter(menuService: menuService)
        
        menuPresenter.menuViewController = viewController
        
        buttonPressed(newPresenter: menuPresenter, newSample: .menuSample, tabBarImageName: "fork.knife", animated: true)
    }
    
    func employeeButtonPressed() {
        
        let employeeService: IEmployeeService = EmployeeService()
        let employeePresenter = EmployeePresenter(employeeService: employeeService)
        
        employeePresenter.employeeViewController = viewController
        
        buttonPressed(newPresenter: employeePresenter, newSample: .employeSample, tabBarImageName: "person.3.fill", animated: true)
    }
    
    func newsButtonPressed() {
        
        let newsService: INewsService = NewsService()
        let newsPresenter = NewsPresenter(newsService: newsService)
        
        newsPresenter.newsViewController = viewController
        
        buttonPressed(newPresenter: newsPresenter, newSample: .newsSample, tabBarImageName: "newspaper", animated: true)
    }
}
