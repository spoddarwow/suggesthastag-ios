//
//  AlbumMenuTableViewCell.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 11/10/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class AlbumMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumDescription: UILabel!
    @IBOutlet weak var albumRecentPicture: UIImageView!
    
   // @IBOutlet weak var albumName: UILabel!
    //@IBOutlet weak var albumRecentPicture: UIImageView!
    //@IBOutlet weak var albumMarkedAsFav: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
