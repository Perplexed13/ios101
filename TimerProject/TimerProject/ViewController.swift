//
//  ViewController.swift
//  TimerProject
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counter = 5
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc(){
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter < 0{
            timer.invalidate()
            timeLabel.text = "Time is over!"
        }
    }

    @IBAction func testClicked(_ sender: Any) {
        print("tabbed")
        counter = 5
    }
    
}

