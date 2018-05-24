//
//  AddEditVC.swift
//  toolkit_assignment_2
//
//  Created by AMIN HEYDARI on 10/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit
import CoreData


class AddEditVC: UIViewController,NSFetchedResultsControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var item : Item? = nil
    
    
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var itemNote: UITextField!
    
    @IBOutlet weak var itemNumber: UITextField!
    
    @IBOutlet weak var imageHolder: UIImageView!
    
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if item != nil {
            
            itemName.text = item?.name
            itemNote.text = item?.note
            itemNumber.text = item?.qty
            imageHolder.image = UIImage(data: (item?.image)! as Data)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImage(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func addImageFromCamera(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
        
    }
  
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
        self.imageHolder.image = image
        
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        if item != nil {
            editItem()
        } else {
            createNewItem()
        }
         dismissVC()
    }

    @IBAction func cancelTapped(_ sender: Any) {
        
        dismissVC()
    }
    
    func dismissVC() {
       _ = navigationController?.popViewController(animated: true)
    }
    
    func createNewItem() {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Item", in: moc)
        
        let item = Item(entity: entityDescription!, insertInto: moc)
        
        item.name = itemName.text
        item.note = itemNote.text
        item.qty = itemNumber.text
        item.image = UIImagePNGRepresentation(imageHolder.image!) as NSData?
        
        do {
            try moc.save()
        } catch {
            return
        }
    }
    
    func editItem() {
        
        item?.name = itemName.text
        item?.note = itemNote.text
        item?.qty = itemNumber.text
        item!.image = UIImagePNGRepresentation(imageHolder.image!) as NSData?
        
        do {
            try moc.save()
        }catch {
            return
        }
        
    }

}
