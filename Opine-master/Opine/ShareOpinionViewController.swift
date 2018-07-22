//
//  ShareOpinionViewController.swift
//  Opine
//
//  Created by Tommy Qiu on 7/12/18.
//  Copyright © 2018 Tommy Co. All rights reserved.
//

import Foundation
import UIKit

class ShareOpinionViewController: UIViewController ,UITextViewDelegate{

    
    var textLength = 50
    let countLetters = UITextView()
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        countLetters.text = String(50 - changedText.count+1 )
        return changedText.count <= 50
    }
    
    
    
    func navBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 100))
        let navItem = UINavigationItem(title: "Hmmmm")
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: nil, action: #selector(cancelAction))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
        
    }
    
    @objc func cancelAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func shareBox(){
        
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let littleView = UIView()
        
        littleView.frame = CGRect(x: width/11.0, y: height/5.0, width: width/1.15, height: 190)
        littleView.layer.cornerRadius = 8
        littleView.layer.borderWidth = 1
        self.view.addSubview(littleView)
        
        let prompt = UITextView()
        prompt.isEditable = false
        prompt.frame = CGRect(x: 0, y: 0, width: width/1.15, height: 70)
        prompt.text = "Smartphones are replacing digital cameras"
        prompt.font = UIFont(name: "Times New Roman", size: 18)
        littleView.addSubview(prompt)
        
        
        let postBox = UITextView()
        postBox.frame = CGRect(x: 0, y: 54 , width: width/1.15, height: 120)
        postBox.text = "Say something about this..."
        postBox.becomeFirstResponder()
        postBox.delegate = self
        postBox.textColor = UIColor.lightGray
        littleView.addSubview(postBox)
        
        
        
        let postButton = UIButton()
        postButton.frame = CGRect(x: width/1.5, y: height/5.0, width: width/8, height: 40)
        postButton.setTitle("Share", for: .normal)
        postButton.setTitleColor(UIColor.black, for: .normal)
        postButton.layer.borderWidth = 1
        postButton.layer.cornerRadius = 8
        postButton.addTarget(self, action: #selector(sharePost), for: .touchUpInside)
        littleView.addSubview(postButton)
        
        
        countLetters.frame = CGRect(x: 0, y: height/5.0, width: width/9.0, height: 40)
        countLetters.text = String(textLength)
        countLetters.font = UIFont(name: "Times New Roman", size: 14)
        countLetters.isEditable=false
        
        littleView.addSubview(countLetters)
        
    }
    
    @objc func sharePost() {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navBar()
        shareBox()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
