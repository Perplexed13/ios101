//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Agah Berkin Güler on 13.02.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var imageDetailView: UIImageView!
    
    var selectedLabel = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelDetail.text = selectedLabel
        imageDetailView.image = selectedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
