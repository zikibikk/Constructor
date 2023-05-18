import UIKit

protocol MenuOutput: AnyObject, ViewOutput {
    func viewWillAppear()
}

protocol MenuInput: UIViewController {
    func show(menuModels: [MenuModel])
}
