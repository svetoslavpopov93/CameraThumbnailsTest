 //
//  ViewController.swift
//  CameraUITest
//
//  Created by Svetoslav Popov on 7.08.18.
//  Copyright © 2018 Svetoslav Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Camera", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! CameraViewController
        navigationController?.pushViewController(vc, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



// Extensions
extension UINavigationController {
    func makeNavigationBarTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
}

extension UINavigationController {
    func makeCurrentViewControllerAsRoot() {
        if let currentVC = self.visibleViewController {
            viewControllers = [currentVC]
        }
    }
}


extension UIView {
    func roundCornersWith(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// NSString localized version
extension NSString {
    @objc var localized: NSString {
        let localizedVersion = NSLocalizedString(self as String, comment: "")
        return localizedVersion as NSString
    }
}
