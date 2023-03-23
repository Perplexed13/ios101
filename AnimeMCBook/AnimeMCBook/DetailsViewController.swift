//
//  DetailsViewController.swift
//  AnimeMCBook
//
//  Created by Agah Berkin Güler on 20.02.2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var chosenMC = ""
    var chosenMCid : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenMC != "" {
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Anime")
            
            let idString = chosenMCid?.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String{
                            nameText.text = name
                        }
                        if let show = result.value(forKey: "show") as? String{
                            showText.text = show
                        }
                        if let year = result.value(forKey: "year") as? Int{
                            yearText.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }else{
                    saveButton.isHidden = false
                    saveButton.isEnabled = false
                }
            }
            catch{
                print("error")
            }
        }
        
        //klavye kapatma
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        //resim ekleme
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true)
    }
    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newAnime = NSEntityDescription.insertNewObject(forEntityName: "Anime", into: context)
        newAnime.setValue(showText.text!, forKey: "show")
        newAnime.setValue(nameText.text!, forKey: "name")
        if let year = Int(yearText.text!){
            newAnime.setValue(year, forKey: "year")
        }
        newAnime.setValue(UUID(), forKey: "id")
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        newAnime.setValue(data, forKey: "image")
        
        do {
            try context.save()
        }catch{
            print("error catched")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"),object: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
