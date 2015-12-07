//
//  MyAlbumMenuTableViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 10/10/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import Photos

class MyAlbumMenuTableViewController: UITableViewController {

    var albums = PHFetchResult()
    var labelString = String();
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var albumPopupMenuABC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelPopUpMenu(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return albums.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("albumNamePopup", forIndexPath: indexPath) as! AlbumMenuTableViewCell
        switch (indexPath.section) {
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
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "photosToShowFromThisAlbum" {
            
            let tabController = segue.destinationViewController as! UITabBarController
            for viewController in tabController.viewControllers! {
                print(viewController)
            }
            let navController = tabController.viewControllers![0] as! UINavigationController
            for viewController in navController.viewControllers {
                print(viewController)
            }
            print("=====")
            let photoViewController = navController.viewControllers[0] as! MyPhotosViewController
            if let selectedAlbumCell = sender as? AlbumMenuTableViewCell {
                photoViewController.albumToShow = selectedAlbumCell.albumName.text!
            }
            
        }
    }

    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.synchronous = true
        manager.requestImageForAsset(asset, targetSize: CGSize(width: 311.0, height: 45.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }

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
