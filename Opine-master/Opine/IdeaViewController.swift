//
//  ViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/12/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import UIKit


class IdeaViewController: UIViewController {
    
    func navBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 100))
        let navItem = UINavigationItem(title: "What do you think?")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: nil, action: 
        
        let doneItem =  UIBarButtonItem(image:UIImage(named: "ic_all_inclusive.png"), style: .plain, target: self, action: nil)
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    @objc func opinion() {
        
    }
    func makeTags(){
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        let text = UITextField(frame: CGRect(x: width/8, y: height/6.0, width: 70, height: 50))
        text.text = "#Success"
        text.font = UIFont(name: "Times New Roman", size: 14)
        text.layer.borderWidth = 1;
        text.layer.cornerRadius = 8;
        self.view.addSubview(text)
    }
    
    func showProfilePic(){
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        let profile = UIImage(named:"boy_3.png")
        let imageView = UIImageView(image: profile!)
        imageView.frame = CGRect(x: width*6.0/8, y: height/6.0, width: 70, height: 70)
        self.view.addSubview(imageView)
    }
    func skipNew(){
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        let quarter = width/4.0
        
        let skipButton = UIButton()
        skipButton.frame = CGRect(x: self.view.frame.size.width/6 , y: height/1.5, width: quarter/1.25, height: quarter/1.25)
        skipButton.setImage(UIImage(named: "skip.png"), for: .normal)
        
        skipButton.addTarget(self, action: #selector(skipQuestion), for: .touchUpInside)
        self.view.addSubview(skipButton)
        
        let newButton = UIButton()
        newButton.frame = CGRect(x: self.view.frame.size.width * 2/3 , y: height/1.5, width: quarter/1.25, height: quarter/1.25)
        newButton.setImage(UIImage(named: "NEW.png"), for: .normal)
        
        newButton.addTarget(self, action: #selector(newButtonShare), for: .touchUpInside)
        self.view.addSubview(newButton)
    }
    @objc func skipQuestion(){
        print("SKI")

        
        UIView.transition(with: self.view, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
        
        for subv in self.view.subviews{
            if (type(of: subv) == UITextView.self){
                let subv = subv as! UITextView
                subv.text = "test"
            }
        }

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    @objc func newButtonShare() {
        let vc = ShareOpinionViewController() //your view controller
        self.present(vc, animated: true, completion: nil)
    }

    

    
    func updateOpinion(){
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        
        let text = UITextView(frame: CGRect(x: 0, y: height/2.0, width: width, height: 70.0))
        text.text = "Hardship is a necessary condition for success"
        text.isEditable = false
        text.font = UIFont(name: "Times New Roman", size: 25)
        self.view.addSubview(text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        updateOpinion()
        navBar()
        showProfilePic()
        skipNew()
        makeTags()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

