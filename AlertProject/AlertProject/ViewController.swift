//
//  ViewController.swift
//  AlertProject
//
//  Created by Agah Berkin Güler on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signupClicked(_ sender: Any) {
        
        if usernameTextField.text == "" {
            makeAlert(title: "Error! Username", message: "username cannot be empty")
        } else if passwordTextField.text == "" {
            makeAlert(title: "Error! Password", message: "password cannot be empty")
        } else if passwordTextField.text != password2TextField.text {
            makeAlert(title: "Error! Password", message: "password cannot be unmatched")
        } else {
            makeAlert(title: "Success", message: "User succesfully signed up!")
        }
        
    }
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

