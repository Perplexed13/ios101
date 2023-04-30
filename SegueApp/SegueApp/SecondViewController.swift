//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    

    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        
        print(myName)

        // Do any additional setup after loading the view.
    }
    

}
