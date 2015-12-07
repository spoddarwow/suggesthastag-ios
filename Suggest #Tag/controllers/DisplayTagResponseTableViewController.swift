//
//  DisplayTagResponseTableViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 5/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class DisplayTagResponseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var displayTags: TagResponses!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayTags.tagResponses.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("albumNamePopup", forIndexPath: indexPath) as! AlbumMenuTableViewCell
        /*switch (indexPath.section) {
        case 0:
        let albumObject = albums[indexPath.row]
        cell.albumName.text = albumObject.localizedTitle;
        let photoFetchOptions = PHFetchOptions()
        photoFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        let collections = PHAsset.fetchAssetsInAssetCollection(albumObject as! PHAssetCollection, options: photoFetchOptions)
        cell.albumDescription.text = "\(collections.count) moments"
        let asset = collections.firstObject as! PHAsset;
        cell.albumRecentPicture.image = getAssetThumbnail(asset)
        default:
        let albumObject = albums[indexPath.row]
        cell.albumName.text = albumObject.localizedTitle;
        let photoFetchOptions = PHFetchOptions()
        photoFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        let collections = PHAsset.fetchAssetsInAssetCollection(albumObject as! PHAssetCollection, options: photoFetchOptions)
        cell.albumDescription.text = "\(collections.count) moments"
        let asset = collections.firstObject as! PHAsset;
        cell.albumRecentPicture.image = getAssetThumbnail(asset)
        }*/
        return cell
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let albumHeaderCell = tableView.dequeueReusableCellWithIdentifier("albumNamePopupHeader") as! MyAlbumPopUpHeaderTableViewCell
        albumHeaderCell.backgroundColor = UIColor.lightGrayColor()
        switch (section) {
        case 0:
            albumHeaderCell.albumHeaderLabel.text = "Favourite";
        case 1:
            albumHeaderCell.albumHeaderLabel.text = "Others";
        default:
            albumHeaderCell.albumHeaderLabel.text = "Other";
        }
        return albumHeaderCell
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
