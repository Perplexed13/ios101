//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Agah Berkin Güler on 18.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var simpsonArr = [SimpsonPerson]()
    
    var chosenSimpson : SimpsonPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //simpson objects
        let homer = SimpsonPerson(name: "Homer Simpson", job: "NuclearSafety", photo: UIImage(named: "HomerSimpson.png")!)
        let bart = SimpsonPerson(name: "Bart Simpson", job: "NuclearSafety", photo: UIImage(named: "BartSimpson.png")!)
        let lisa = SimpsonPerson(name: "Lisa Simpson", job: "NuclearSafety", photo: UIImage(named: "LisaSimpson.png")!)
        let maggie = SimpsonPerson(name: "Maggie Simpson", job: "NuclearSafety", photo: UIImage(named: "MaggieSimpson.png")!)
        let marge = SimpsonPerson(name: "Marge Simpson", job: "NuclearSafety", photo: UIImage(named: "MargeSimpson.png")!)
        let krusty = SimpsonPerson(name: "Krusty The Clown", job: "NuclearSafety", photo: UIImage(named: "krustyTheClown.png")!)
        simpsonArr.append(homer)
        simpsonArr.append(bart)
        simpsonArr.append(lisa)
        simpsonArr.append(maggie)
        simpsonArr.append(marge)
        simpsonArr.append(krusty)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonArr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonArr[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

