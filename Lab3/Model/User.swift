//
//  User.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 19.04.2022.
//

import Foundation
import UIKit
struct User {
    let firstName: String
    let surName: String
    var fullName: String {
        return self.firstName + " " + self.surName
    }
    let userName: String
    let numberOfFriends: Int
    let profession: String
    let profileImage: UIImage
    let isOnline: Bool
    let isMyFriend: Bool
}
extension User {
    static let users = [User(firstName: "Nurym", surName: "Nagymetov", userName: "Rfubag", numberOfFriends: 12, profession: "Developer", profileImage: UIImage(named: "Photo")!, isOnline: true, isMyFriend: false)
    ]
}
