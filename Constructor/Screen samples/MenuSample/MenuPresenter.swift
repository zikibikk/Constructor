import UIKit

protocol IMenuService {
    func getMenu(closure: ([MenuModel])->())
}

class MenuService: IMenuService {
    func getMenu(closure: ([MenuModel])->()) {
        closure([.init(food: "Морковь вареная", components: "Морковь, соль, сахар"),
                 .init(image: UIImage(systemName: "birthday.cake.fill"), food: "Торт денрожденный", components: "Любовь, мука, яйца, шоколад")])
    }
}

class MenuPresenter: MenuOutput {
    
    var sample = Samples.menuSample
    
    weak var menuViewController: MenuInput?
    
    private let menuService: IMenuService
    
    init(menuService: IMenuService) {
        self.menuService = menuService
    }
    
    func viewWillAppear() {
        menuService.getMenu(closure: { menuViewController?.show(menuModels: $0)} )
    }
    
}
