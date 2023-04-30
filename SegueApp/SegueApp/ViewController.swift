//
//  ViewController.swift
//  SegueApp
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        nameTextField.text = ""
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }

    @IBAction func saveClicked(_ sender: Any) {
        userName = nameTextField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            //as
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }
}

