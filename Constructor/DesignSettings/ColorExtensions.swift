import UIKit

extension UIColor {
    private static func devide(a: CGFloat) -> CGFloat { return a/255 }
}

extension UIColor {
    
    static var instructionColor: UIColor {
        return UIColor(red: devide(a: 199), green: devide(a: 192), blue: devide(a: 212), alpha: 1)
    }
    
    static var menuColor: UIColor {
        return UIColor(red: devide(a: 217), green: devide(a: 161), blue: devide(a: 172), alpha: 1)
    }
    
    static var employeeColor: UIColor {
        return UIColor(red: devide(a: 235), green: devide(a: 201), blue: devide(a: 195), alpha: 1)
    }
    
    static var newsColor: UIColor {
        return UIColor(red: devide(a: 184), green: devide(a: 133), blue: devide(a: 163), alpha: 1)
    }
    
    static var companyColor: UIColor {
        return UIColor(red: devide(a: 101), green: devide(a: 107), blue: devide(a: 156), alpha: 1)
    }
}

