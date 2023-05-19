import UIKit

protocol IMenuService {
    func getMenu(closure: ([MenuModel])->())
}

class MenuService: IMenuService {
    func getMenu(closure: ([MenuModel])->()) {
        closure([.init(food: "Морковь вареная", components: "Морковь, соль, сахар"),
                 .init(image: UIImage(systemName: "birthday.cake.fill"), food: "Торт на день рождения", components: "Любовь, мука, яйца, шоколад"),
                 .init(food: "Пицца заяц", components: "Морковь, мука пшеничная, пророщенная фасоль"),
                 .init(food: "Салат Наполено", components: "Помидорры чери, куриная грудка, пармезан, бегет, салат айсберг, соус цезарь"),
                 .init(image: UIImage(systemName: "cup.and.saucer"),food: "Капуччино", components: "Молоко, молочная пена, еспрессо"),
                 .init(image: UIImage(systemName: "mug.fill"), food: "Кола", components: "Кола добрый, лёд")])
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
