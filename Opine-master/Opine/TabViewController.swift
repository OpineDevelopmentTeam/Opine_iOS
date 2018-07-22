//
//  TabViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/14/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import Foundation
import UIKit

class TabViewController :UITabBarController{
    func loadAll(){
        let ideaVC = IdeaViewController()
        
        
        
        ideaVC.tabBarItem = UITabBarItem(title: "Idea",
                                         image: UIImage(named: "bulb_L.png"),
                                         tag: 0)
        ideaVC.tabBarItem.selectedImage = UIImage(named: "bulb_F.png")
        
        let statVC = StatViewController()
        
        statVC.tabBarItem = UITabBarItem(title: "Stat",
                                         image: UIImage(named: "bar_chart_L.png"),
                                         tag: 1)
        statVC.tabBarItem.selectedImage = UIImage(named: "bar_chart_F.png")

        let roomVC = RoomViewController()
        
        roomVC.tabBarItem = UITabBarItem(title: "room",
                                         image: UIImage(named: "building_L.png"),
                                         tag: 2)
        roomVC.tabBarItem.selectedImage = UIImage(named: "building_F.png")
        let homeVC = HomeViewController()

        
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(named: "home_L.png"),
                                         tag: 3)
        homeVC.tabBarItem.selectedImage = UIImage(named: "home_F.png")
    
        let tabBarList = [ideaVC,statVC,roomVC,homeVC]
        
        viewControllers = tabBarList
        
    }
    
    
    override func viewDidLoad() {
        loadAll()
    }
}
