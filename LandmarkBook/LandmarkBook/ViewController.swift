//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Agah Berkin Güler on 13.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenName = ""
    var chosenImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Anitkabir")
        landmarkNames.append("Burj Khalifa")
        landmarkNames.append("Opera House")
        landmarkNames.append("Pisa Tower")
        landmarkNames.append("Tower Bridge")
        
        
        landmarkImages.append(UIImage(named: "anitkabir.jpeg")!)
        landmarkImages.append(UIImage(named: "burjkhalifa.jpeg")!)
        landmarkImages.append(UIImage(named: "operahouse.jpeg")!)
        landmarkImages.append(UIImage(named: "pisatower.jpeg")!)
        landmarkImages.append(UIImage(named: "towerbridge.jpeg")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.image = landmarkImages[indexPath.row]
        //content.secondaryText = "Test"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLabel = self.chosenName
            destinationVC.selectedImage = self.chosenImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

