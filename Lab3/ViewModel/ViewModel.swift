//
//  ViewModel.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 23.04.2022.
//

import Foundation
import UIKit
class ViewModel {
    var color = Dynamic(UIColor())
    @objc func addButtonPressed(isMyFriend: Bool) {
        print("asdfs")
        if isMyFriend {
            color.value = .brown
        } else {
            color.value = .green
        }
        
    }
}
