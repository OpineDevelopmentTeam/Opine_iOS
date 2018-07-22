//
//  RoomViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/13/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import Foundation
import UIKit

class RoomViewController: UIViewController {
    func navBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 100))
        let navItem = UINavigationItem(title: "Let's Talk!")
        let refresh = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: nil, action: nil)
        let add = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: nil, action: nil)
        
        navItem.leftBarButtonItem = refresh
        navItem.rightBarButtonItem = add
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        navBar()
    }
}

