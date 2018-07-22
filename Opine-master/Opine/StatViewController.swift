//
//  StatViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/13/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import Foundation
import UIKit



class StatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let myArray: NSArray = ["What's Hot","First","Second","Third"]
    private let myPartArray: NSArray = ["My Participation","First","Second","Third"]
    private var myTableView: UITableView!
    private var myPartTableView: UITableView!
    

    

    
        
    func Hot(){
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y:100, width: displayWidth, height: displayHeight/3.5))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.delegate = self
        myTableView.isScrollEnabled = false
        
        self.view.addSubview(myTableView)
        
    }
    
    func myPart(){
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myPartTableView = UITableView(frame: CGRect(x: 0, y: displayHeight/3.5 * 1.75 + 50, width: displayWidth, height: displayHeight/3.5))
        myPartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myPartTableView.dataSource = self
        myPartTableView.delegate = self
        myPartTableView.isScrollEnabled = false
        self.view.addSubview(myPartTableView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navBar()
        Hot()
        myPart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func navBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 100))
        let navItem = UINavigationItem(title: "People's Opinions")
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHeight: CGFloat = 44.0
        
        

        
        if tableView == myTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(myArray[indexPath.row])"
            if (indexPath.row == 0){
                let seeMore = UIButton()
                seeMore.frame = CGRect(x: 40 , y: 60, width:100, height: 24)
                seeMore.center = CGPoint(x: view.bounds.width / 1.2, y: cellHeight / 2.0)
                seeMore.setTitle("See more", for: .normal)
                seeMore.setTitleColor(UIColor.gray, for: .normal)
                seeMore.addTarget(self, action: #selector(seeMoreHot), for: .touchUpInside)
                cell.addSubview(seeMore)
                
            }
            return cell
        }
        else if tableView == myPartTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(myPartArray[indexPath.row])"
            if (indexPath.row == 0){
                let seeMore = UIButton()
                seeMore.frame = CGRect(x: 40 , y: 60, width:100, height: 24)
                seeMore.center = CGPoint(x: view.bounds.width / 1.2, y: cellHeight / 2.0)
                seeMore.setTitle("See more", for: .normal)
                seeMore.setTitleColor(UIColor.gray, for: .normal)
                
                seeMore.addTarget(self, action: #selector(seeMorePart), for: .touchUpInside)
                
                cell.addSubview(seeMore)
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "NODATASOURCE"
            return cell
        }
    }
    @objc func seeMoreHot() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        myTableView.frame = CGRect(x: 0 , y: 100, width:width, height: height/1.4)
        myTableView.isScrollEnabled = true
        myPartTableView.isHidden = true
        let path0 = IndexPath(row: 0, section: 0)
        let cell0 = myTableView.cellForRow(at: path0)
        
        for sub in (cell0?.subviews)!{
            if (type(of: sub)) == UIButton.self{
                let theButton = sub as! UIButton
                theButton.setTitle("Show Less", for: .normal)
                theButton.removeTarget(nil, action: nil, for: .allEvents)
                theButton.addTarget(self, action: #selector(seeLessHot), for: .touchUpInside)
            }
        }
    }
    
    @objc func seeMorePart() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        myPartTableView.frame = CGRect(x: 0 , y: 100, width:width, height: height/1.4)
        myPartTableView.isScrollEnabled = true
        myTableView.isHidden = true
        let path0 = IndexPath(row: 0, section: 0)
        let cell0 = myPartTableView.cellForRow(at: path0)
        
        for sub in (cell0?.subviews)!{
            if (type(of: sub)) == UIButton.self{
                let theButton = sub as! UIButton
                theButton.setTitle("Show Less", for: .normal)
                theButton.removeTarget(nil, action: nil, for: .allEvents)
                theButton.addTarget(self, action: #selector(seeLessPart), for: .touchUpInside)
            }
        }
        
    }
    
    @objc func seeLessPart() {
        print("HERE")
        
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let path0 = IndexPath(row: 0, section: 0)
        let cell0 = myPartTableView.cellForRow(at: path0)
        
        for sub in (cell0?.subviews)!{
            if (type(of: sub)) == UIButton.self{
                print("HA")
                let theButton = sub as! UIButton
                theButton.setTitle("Show more", for: .normal)
                theButton.removeTarget(nil, action: nil, for: .allEvents)
                theButton.addTarget(self, action: #selector(seeMorePart), for: .touchUpInside)
            }
        }
        
        myPartTableView.frame = CGRect(x: 0, y: height/3.5 * 1.75 + 50, width: width, height: height/3.5)
        myTableView.isHidden = false
        myPartTableView.isScrollEnabled = false
        
        
        
    }
    
    @objc func seeLessHot() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let path0 = IndexPath(row: 0, section: 0)
        let cell0 = myTableView.cellForRow(at: path0)
        
        for sub in (cell0?.subviews)!{
            if (type(of: sub)) == UIButton.self{
                let theButton = sub as! UIButton
                theButton.setTitle("Show more", for: .normal)
                theButton.removeTarget(nil, action: nil, for: .allEvents)
                theButton.addTarget(self, action: #selector(seeMoreHot), for: .touchUpInside)
            }
        }
        
        myTableView.frame = CGRect(x: 0, y:100, width: width, height: height/3.5)
        myPartTableView.isHidden = false
        myTableView.isScrollEnabled = false
        
        
    }
    
    

}
