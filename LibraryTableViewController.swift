//
//  LibraryTableViewController.swift
//  toolkit_assignment_2_final
//
//  Created by AMIN HEYDARI on 17/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
    
    // here I import my library ( I input my MusicLibrary.swift )
    var library = MusicLibrary().library
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library.count
    }
    
    // in this function I configure my cells
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // here I create my cells which will show in table view
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! SongTableViewCell
        
        // here I assign all of the value which I need
        // I call all my information from my library and put them in a cells
        
        cell.artistLabel.text = library[indexPath.row]["artist"]
        
        cell.songTitleLabel.text = library[indexPath.row]["title"]
        
        if let coverImage = library[indexPath.row]["coverImage"] {
            
            cell.coverImageView.image = UIImage(named: "\(coverImage).jpg")
            
        }
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayer", sender: self)
    }

    
    // MARK: - Navigation
    
    // This function is for when user click on each song or cell, automatically go to player page via showPlayer identifier as a seque connection
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer" {
            
            let playerVC = segue.destination as! PlayerViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            // pass the track ID for the selected index path
            playerVC.trackId = indexPath.row
            
        }

    }
    
    
}
