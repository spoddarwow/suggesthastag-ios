//
//  TagSearchTableViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 7/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class TagSearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var filteredTags = [TagResponse]();
    var unfilteredTags = [TagResponse]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        let nibName = UINib(nibName: "TagSearchTableViewCell", bundle:nil)
        //self.tableView.registerNib(nibName, forCellReuseIdentifier: "Cell")
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.searchDisplayController!.searchBar.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredTags.count
        }else{
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tagDetailsCell = self.tableView.dequeueReusableCellWithIdentifier("TagSearchTableViewCell") as! TagSearchTableViewCell

        //print("tableView \(tableView.dequeueReusableCellWithIdentifier("tagDetailsSearch"))")
        //let tagDetailsCell = tableView.dequeueReusableCellWithIdentifier("CustomCellOne", forIndexPath: indexPath) as! TagSearchTableViewCell
        let tagDetails = filteredTags[indexPath.row];
        tagDetailsCell.tagName.text = tagDetails.tagName;
        //tagDetailsCell.tagMediaCount.text = "Media Count: \(tagDetails.mediaCount)";
        return tagDetailsCell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        var tempSearchText = searchText;
        if(!searchText.hasPrefix("#")){
            tempSearchText = "#\(searchText)"
        }
        
        self.filteredTags = self.unfilteredTags.filter({(tags) -> Bool in
            let stringMatch = tags.tagName.rangeOfString(tempSearchText, options: NSStringCompareOptions.CaseInsensitiveSearch);
            return (stringMatch != nil)
        })
        print("tags \(self.filteredTags)");
        //self.tableView.reloadData()
    }
}
