//
//  MainTVC.swift
//  toolkit_assignment_2
//
//  Created by AMIN HEYDARI on 10/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit
import CoreData

class MainTVC: UITableViewController, NSFetchedResultsControllerDelegate{
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var frc : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult> {
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        }catch{
            print("failed to perform fetch.")
            return
        }
        
        self.tableView.rowHeight = 100
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "bg8.jpg"))
        self.tableView.reloadData()
        
  
        


    }
    
    override func viewDidAppear(_ animated: Bool) {
        frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        }catch{
            print("failed to perform fetch.")
            return
        }

        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        let numberOfSections = frc.sections?.count
        return numberOfSections!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }


    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        }else{
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }

        // Configure the cell...

        cell.textLabel?.textColor = UIColor.darkGray
        // cell.detailTextLabel?.backgroundColor = UIColor.darkGray
        
        let item = frc.object(at: indexPath) as! Item
        
        cell.textLabel?.text = item.name
        let note = item.note
        let qty = item.qty
        
        cell.detailTextLabel!.text = " Note: \(note!) Priority: \(qty!)"
        
        cell.imageView?.image = UIImage(data: (item.image)! as Data)
        
        
        
        
        
        return cell
    }


   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        let managedObject : NSManagedObject = frc.object(at: indexPath) as! NSManagedObject
        moc.delete(managedObject)
        
        do {
            try moc.save()
        }catch{
            print("failed to save.")
            return
        }
    }
    
    


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "edit"  {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let itemController : AddEditVC = segue.destination as! AddEditVC
            let item : Item = frc.object(at: indexPath!) as! Item
            itemController.item = item
            
        }
    }


}
