//
//  ViewController.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 18.04.2022.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . white
        
        let vc1 = MyFeedViewController()
        let vc2 = UINavigationController(rootViewController: MyFriendsViewController())
        let vc3 = MyPinsViewController()
        let vc4 = MyProfileViewController()
        
        vc1.title = "My Feed".locolized()
        vc2.title = "My Friends".locolized()
        vc3.title = "My Pins".locolized()
        vc4.title = "My Profile".locolized()
    
        self.setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        self.tabBar.backgroundColor = UIColor().tabBarColor
        self.modalPresentationStyle = .fullScreen
        
        guard let items = self.tabBar.items else {return}
        let image = ["text.below.photo.fill", "person.2.fill", "pin.fill", "rectangle.stack.person.crop.fill"]
        for i in 0...items.count - 1 {
            items[i].image = UIImage(systemName: image[i])
        }
    }
}


