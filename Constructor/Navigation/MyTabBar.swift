import UIKit

class MyTabBar: UITabBarController {
    
    private var previousItem: UITabBarItem = UITabBarItem()
    
    override func viewWillAppear(_ animated: Bool) {
        previousItem = tabBar.items?[selectedIndex] ?? UITabBarItem()
        super.viewWillAppear(animated)
    }
    
    init(conts: [ChangableViewController]) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = conts
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item === previousItem) {
            let modalController = ChangeSampleViewController(presenter: self)
            selectedViewController?.present(modalController, animated: true)
        } else { previousItem = item }
    }
}

extension MyTabBar: IChangePresenter {
    func menuButtonPressed() {
        guard let controller = selectedViewController as? ChangableViewController else { return }
        
        let menuService: IMenuService = MenuService()
        let menuPresenter = MenuPresenter(menuService: menuService)
        menuPresenter.menuViewController = controller
        
        controller.presenter = menuPresenter
        menuPresenter.viewWillAppear()
        controller.dismiss(animated: true)
    }
    
    func employeeButtonPressed() {
        guard let controller = selectedViewController as? ChangableViewController else { return }
        
        let employeeService: IEmployeeService = EmployeeService()
        let employeePresenter = EmployeePresenter(employeeService: employeeService)
        employeePresenter.employeeViewController = controller
        
        controller.presenter = employeePresenter
        employeePresenter.viewWillAppear()
        controller.dismiss(animated: true)
    }
    
    
}
