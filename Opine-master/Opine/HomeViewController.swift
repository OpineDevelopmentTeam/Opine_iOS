//
//  HomeViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/13/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import Foundation
import UIKit
class HomeViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 1220
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        setupScrollView()
        setUpPage()
//        makeBar()
        navBar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupScrollView(){
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.textColor = .black
        firstLabel.text = "Top of our ScrollView"
        
        scrollView.addSubview(firstLabel)
        
        firstLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        firstLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.textColor = .black
        secondLabel.text = "Bottom of our ScrollView"
        
        scrollView.addSubview(secondLabel)
        
        secondLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1900).isActive = true
        secondLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        secondLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
    }
    
    func navBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 100))
        let navItem = UINavigationItem(title: "Know yourself better!!")
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    func setUpPage(){
        let width = self.view.frame.width
        let height = scrollView.contentSize.height
        let littleView = UIView()

        littleView.frame = CGRect(x:0 ,y: height/20.0, width: width, height: 140)
        littleView.layer.cornerRadius = 8
        littleView.layer.borderWidth = 1
        scrollView.addSubview(littleView)
        
        let littleHeight = littleView.frame.size.height
            
        let profile = UIImage(named:"boy_4.png")
        let profileImageView = UIImageView(image: profile!)
        profileImageView.frame = CGRect(x: 0, y: littleHeight/4, width: 100, height: 100)
        littleView.addSubview(profileImageView)
        
        let hashtagView = UIView()
        hashtagView.frame = CGRect(x:0 ,y: height*3.5/20, width: width, height: 200)
        hashtagView.layer.cornerRadius = 8
        hashtagView.layer.borderWidth = 1
        scrollView.addSubview(hashtagView)
        
        let big5View = UIView()
        big5View.frame = CGRect(x:0 ,y: height*7.5/20, width: width, height: 465)
        big5View.layer.cornerRadius = 8
        big5View.layer.borderWidth = 1
        scrollView.addSubview(big5View)
        
        let big5 = UIImage(named:"Group_5.png")
        let big5imageView = UIImageView(image: big5!)
        big5imageView.frame = CGRect(x: 0, y: littleHeight/4, width: 300, height: 300)
    
        big5imageView.center = CGPoint(x:big5View.frame.size.width  / 2,
                                       y: big5View.frame.size.height / 2);
        big5View.addSubview(big5imageView)
        
        let peerView = UIView()
        peerView.frame = CGRect(x:0 ,y:  height*16/20.0, width: width, height: 150)
        peerView.layer.cornerRadius = 8
        peerView.layer.borderWidth = 1
        scrollView.addSubview(peerView)
        
    }
    
    
    
    
    
    
}
