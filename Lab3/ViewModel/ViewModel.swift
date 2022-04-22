//
//  ViewModel.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 23.04.2022.
//

import Foundation
import UIKit
class ViewModel {
    var titleText = Dynamic(String())
    var titleColor = Dynamic(UIColor())
    var backgroundColor = Dynamic(UIColor())
    var image = Dynamic(UIImage())
    var borderColor = Dynamic(CGColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.33))
    
    @objc func addButtonPressed(isMyFriend: Bool) {
        if !isMyFriend {
            titleText.value = "ADDED".locolized()
            titleColor.value = .tertiaryLabel
            backgroundColor.value = UIColor().buttonBackGroundColor
            image.value = UIImage(systemName: "checkmark.circle")!
            borderColor.value = CGColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.33)
        }
        if isMyFriend {
            titleText.value = "ADD".locolized()
            titleColor.value = .systemBlue
            backgroundColor.value = .systemBackground
            image.value = UIImage(systemName: "plus.circle")!
            borderColor.value = CGColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        }
    }
}
