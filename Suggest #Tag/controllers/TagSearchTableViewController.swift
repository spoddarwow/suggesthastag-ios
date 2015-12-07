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
        let tagDetailsCell = self.tableView.dequeueReusableCellWithIdentifier("tagSearchCell") as! TagSearchTableViewCell

        //print("tableView \(tableView.dequeueReusableCellWithIdentifier("tagDetailsSearch"))")
        //let tagDetailsCell = tableView.dequeueReusableCellWithIdentifier("CustomCellOne", forIndexPath: indexPath) as! TagSearchTableViewCell
        let tagDetails = filteredTags[indexPath.row];
        tagDetailsCell.tagName.text = tagDetails.tagName;
        //tagDetailsCell.tagMediaCount.text = "Media Count: \(tagDetails.mediaCount)";
        return tagDetailsCell
    }

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
        self.tableView.reloadData()
    }
}
