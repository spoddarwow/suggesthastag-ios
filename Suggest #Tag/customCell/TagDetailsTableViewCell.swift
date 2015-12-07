//
//  TagDetailsTableViewCell.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 6/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class TagDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var tagMediaCount: UILabel!
    @IBOutlet weak var tagCellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tagCellSwitch(sender: UISwitch) {
        print("Switch on ");
    }
}
