//
//  SongTableViewCell.swift
//  toolkit_assignment_2_final
//
//  Created by AMIN HEYDARI on 17/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    // table view cell for connect as a outlet for song's title, cover image, and artist name
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
