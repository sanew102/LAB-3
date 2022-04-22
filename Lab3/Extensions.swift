//
//  Extensions.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 19.04.2022.
//

import Foundation
import UIKit
extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

extension String {
    func locolized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}

extension UIApplication {
    var statusBarView: UIView? {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
            return nil
        }
}

extension UINavigationController {
    var statusBarUIView: UIView? {

        if #available(iOS 13.0, *) {
            let tag = 3848245

            let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows.first

            if let statusBar = keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
                let statusBarView = UIView(frame: height)
                statusBarView.tag = tag
                statusBarView.layer.zPosition = 999999

                keyWindow?.addSubview(statusBarView)
                return statusBarView
            }

        } else {

            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
      }
}

extension UIColor {
    var tabBarColor: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.92)
            default:
                return UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 0.8)
            }
        }
    }
    
    var tableViewColor: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return .secondaryLabel
            default:
                return .black
            }
        }
    }
    
    var textLabelColor: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return .white
            default:
                return .systemBlue
            }
        }
    }
    
}

