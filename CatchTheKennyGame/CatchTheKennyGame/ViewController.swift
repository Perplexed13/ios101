//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var kenny10: UIImageView!
    @IBOutlet weak var kenny11: UIImageView!
    @IBOutlet weak var kenny12: UIImageView!
    @IBOutlet weak var kenny13: UIImageView!
    @IBOutlet weak var kenny14: UIImageView!
    @IBOutlet weak var kenny15: UIImageView!
    @IBOutlet weak var kenny16: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = "Score \(score)"
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        kenny10.isUserInteractionEnabled = true
        kenny11.isUserInteractionEnabled = true
        kenny12.isUserInteractionEnabled = true
        kenny13.isUserInteractionEnabled = true
        kenny14.isUserInteractionEnabled = true
        kenny15.isUserInteractionEnabled = true
        kenny16.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        kenny10.addGestureRecognizer(recognizer10)
        kenny11.addGestureRecognizer(recognizer11)
        kenny12.addGestureRecognizer(recognizer12)
        kenny13.addGestureRecognizer(recognizer13)
        kenny14.addGestureRecognizer(recognizer14)
        kenny15.addGestureRecognizer(recognizer15)
        kenny16.addGestureRecognizer(recognizer16)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9,kenny10,kenny11,kenny12,kenny13,kenny14,kenny15,kenny16]
        
        
        counter = 10
        timerLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaseCounter), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        hideKenny()
        
        
    }
    
    @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
        print(random+1)
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score \(score)"
    }
    
    @objc func decreaseCounter(){
        counter -= 1
        timerLabel.text = "Time \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray{
                kenny.isHidden = true
            }
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore,forKey: "highscore")
            }
            
            
            let  alert = UIAlertController(title: "Time is Up!", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            
            let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){
                (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timerLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseCounter), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive)
            
            alert.addAction(yesButton)
            alert.addAction(noButton)
            
            self.present(alert, animated: true)
        }
    }


}

