import UIKit

class MenuAssembly {
    
    static func assemble () -> UIViewController {
    
        let menuService: IMenuService = MenuService()
        
        let presenter = MenuPresenter(menuService: menuService)
        
        let viewController = MenuViewController(presenter: presenter)
        
        presenter.menuViewController = viewController
        
        return viewController
    }
    
}
