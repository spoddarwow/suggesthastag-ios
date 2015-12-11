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
    var parentTableViewController: SuggestedHashTagViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tagCellSwitch(sender: UISwitch) {
        var tagsToCopySet = parentTableViewController.tagResponseToShow.response.responseData.tagCopiedTag;
        
        if sender.on {
            if(!tagsToCopySet.contains((self.tagName?.text)!)){
                tagsToCopySet.insert((self.tagName?.text)!);
            }
        } else {
            tagsToCopySet.remove((self.tagName?.text)!);
        }
        parentTableViewController.tagResponseToShow.response.responseData.tagCopiedTag = tagsToCopySet;
    }
}
