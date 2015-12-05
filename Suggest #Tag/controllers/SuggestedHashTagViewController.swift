//
//  SuggestedHashTagViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 5/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit

class SuggestedHashTagViewController: UIViewController,UITabBarDelegate {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tagsDisplayTableView: UITableView!
    var tagResponseToShow: DecorateHashTagResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.selectedItem = tabBar.items![0] as UITabBarItem;
        print("Start Processsing this tab");
        tabBar(tabBar, didSelectItem: tabBar.selectedItem!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("Processs this tab");
        print(item.tag);
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
