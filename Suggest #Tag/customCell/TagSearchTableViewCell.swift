//
//  TagSearchTableViewCell.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 7/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class TagSearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var tagMediaCount: UILabel!
    @IBOutlet weak var tagSearchSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tagSearchRowSwitch(sender: UISwitch) {
        print("Switch value changed \(sender)");
    }
    
}
