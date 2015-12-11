//
//  SuggestedHashTagViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 5/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class SuggestedHashTagViewController: UIViewController,UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tagDisplayTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    
    var currentSeletedTabTag = 0;
    public var tagResponseToShow: DecorateHashTagResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.selectedItem = tabBar.items![0] as UITabBarItem;
        tabBar(tabBar, didSelectItem: tabBar.selectedItem!)
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelTagResult(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func performCopyTagAction(sender: UIButton) {
        UIPasteboard.generalPasteboard().string = convertTagSetToString();
        let alertController = UIAlertController(title: "Tags Copies", message:
            "", preferredStyle: UIAlertControllerStyle.Alert)
        let delay = 1.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alertController.dismissViewControllerAnimated(true, completion: nil)
        })
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag {
            case 0 :
                currentSeletedTabTag = 0;
                break
            case 1:
                currentSeletedTabTag = 1;
                break
            default:
                currentSeletedTabTag = 0;
                break

        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tagResponseToShow.response.responseData.tagResponseMap.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tagAlphabetSection = tagResponseToShow.response.responseTagAlphabet.tagAplhabets[section];
        let tagsToDisplay = tagResponseToShow.response.responseData.tagResponseMap[tagAlphabetSection];
        return tagsToDisplay!.tagResponses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tagDetailsCell = tableView.dequeueReusableCellWithIdentifier("tagDetails", forIndexPath: indexPath) as! TagDetailsTableViewCell
        let tagAlphabetSection = tagResponseToShow.response.responseTagAlphabet.tagAplhabets[indexPath.section];
        var tagsToDisplay = tagResponseToShow.response.responseData.tagResponseMap[tagAlphabetSection];
        switch currentSeletedTabTag{
        case 0:
            let tagDetails = tagsToDisplay?.tagResponses[indexPath.row];
            tagDetailsCell.tagName.text = tagDetails!.tagName;
            tagDetailsCell.tagMediaCount.text = "Media Count: \(tagDetails!.mediaCount)";
            tagDetailsCell.parentTableViewController = self;
            break;
        default:
            break;
        }
        return tagDetailsCell
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tagAlphabetHeaderCell = tableView.dequeueReusableCellWithIdentifier("tagAlphabetHeader") as! TagAlphabetHeaderTableViewCell
        tagAlphabetHeaderCell.backgroundColor = UIColor.lightGrayColor()
        tagAlphabetHeaderCell.tabAlphabetHeader.text = tagResponseToShow.response.responseTagAlphabet.tagAplhabets[section];
        return tagAlphabetHeaderCell
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return tagResponseToShow.response.responseTagAlphabet.tagAplhabets
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        let tempAlphabetArray = tagResponseToShow.response.responseTagAlphabet.tagAplhabets as NSArray
        return tempAlphabetArray.indexOfObject(title)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tagSearchSegue" {
            let navController = segue.destinationViewController as! UINavigationController
            let searchDestController = navController.viewControllers[0] as! TagSearchTableViewController
            searchDestController.unfilteredTags = tagResponseToShow.response.responseData.tagsList;
            searchDestController.modalPresentationStyle = UIModalPresentationStyle.Popover
            
        }

    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        let activeTabTag = self.tabBar.selectedItem?.tag;
        if (sender.direction == .Left) {
            print("Swipe Left \(self.tabBar.selectedItem?.tag)")
            if(activeTabTag != 2){
                //var labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 50.0, self.swipeLabel.frame.origin.y);
                //swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
                tabBar.selectedItem = tabBar.items![activeTabTag! + 1] as UITabBarItem;
                tabBar(tabBar, didSelectItem: tabBar.selectedItem!)
            }else{
                print("Swipe Left End Reached")
            }
        }
        
        if (sender.direction == .Right) {
            print("Swipe Right \(self.tabBar.selectedItem?.tag)")
            //var labelPosition = CGPointMake(self.swipeLabel.frame.origin.x + 50.0, self.swipeLabel.frame.origin.y);
            //swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
            if(activeTabTag != 0){
                //var labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 50.0, self.swipeLabel.frame.origin.y);
                //swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
                tabBar.selectedItem = tabBar.items![activeTabTag! - 1] as UITabBarItem;
                tabBar(tabBar, didSelectItem: tabBar.selectedItem!)
            }else{
                print("Swipe Left Right Reached")
            }

        }
    }
    
    func convertTagSetToString() -> String {
        var finalCopiedString = "";
        var tagsToCopySet = self.tagResponseToShow.response.responseData.tagCopiedTag;
        if(tagsToCopySet.count > 0){
            for copyTag in tagsToCopySet {
                finalCopiedString += copyTag + " ";
            }
        }
        return finalCopiedString
    }

}
