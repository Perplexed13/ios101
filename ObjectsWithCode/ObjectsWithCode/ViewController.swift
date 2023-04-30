//
//  ViewController.swift
//  ObjectsWithCode
//
//  Created by Agah Berkin Güler on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width/2 - width * 0.8/2, y: height/2 - 50/2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width/2 - 100, y: height * 0.6, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myFunc), for: UIControl.Event.touchUpInside)
    }
    
    @objc func myFunc() {
        print("tabbed")
        myLabel.text = "button tapped"
    }


}

