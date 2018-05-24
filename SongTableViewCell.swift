//
//  SongTableViewCell.swift
//  toolkit_assignment_2_final
//
//  Created by AMIN HEYDARI on 17/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit

class SongTableViewCell: UIViewController {

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
