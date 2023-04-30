//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Agah Berkin Güler on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getCurrencyClicked(_ sender: Any) {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                    //async
                    DispatchQueue.main.async {
                        if let currencies = jsonResponse["rates"] as? [String : Any]{
                            if let gbp = currencies["GBP"] as? Double{
                                self.gbpLabel.text = "GBP: \(gbp)"
                            }
                            if let usd = currencies["USD"] as? Double{
                                self.usdLabel.text = "USD: \(usd)"
                            }
                            if let tryc = currencies["TRY"] as? Double{
                                self.tryLabel.text = "TRY: \(tryc)"
                            }
                            if let jpy = currencies["JPY"] as? Double{
                                self.jpyLabel.text = "JPY: \(jpy)"
                            }
                        }
                    }
                } catch {
                    print("error")
                }
            }
            
        }
        task.resume()
    }
    
}

