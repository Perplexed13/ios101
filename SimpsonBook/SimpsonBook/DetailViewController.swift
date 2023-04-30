//
//  DetailViewController.swift
//  SimpsonBook
//
//  Created by Agah Berkin Güler on 18.02.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : SimpsonPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedSimpson != nil {
            nameLabel.text = selectedSimpson?.name
            jobLabel.text = selectedSimpson?.job
            imageView.image = selectedSimpson?.photo
        }

        // Do any additional setup after loading the view.
    }
    


}
