//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic(){
        temp += 1
        if temp == 0{
            changePicandLabel(image: "eminem3", label: "The Eminem Show")
        }else if temp == 1{
            changePicandLabel(image: "eminem4", label:  "Eminem")
        }else {
            changePicandLabel(image: "eminem2", label: "Marshall Mathers and Hallie")
            temp = -1
        }
        
    }
    
    func changePicandLabel(image: String,label: String){
        imageView.image = UIImage(named: image)
        imageLabel.text = label
    }
    
}

