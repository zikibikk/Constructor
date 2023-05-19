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
            let changePresenter = ChangePresenter()
            changePresenter.viewController = (selectedViewController as! ChangableViewInput)
            let modalController = ChangeSampleViewController(presenter: changePresenter)
            selectedViewController?.present(modalController, animated: true)
        } else { previousItem = item }
    }
}

