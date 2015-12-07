//
//  MyPhotoFInalStepViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 12/10/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import MobileCoreServices

class MyPhotoFinalStepViewController: UIViewController {

    var image:UIImage? = nil
    @IBOutlet weak var selectedPhoto: UIImageView!
    let imagePickerObject = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPhoto.contentMode = .ScaleAspectFit
        selectedPhoto.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelFinalPhotoSelection(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "processChoosenPhotoForTags" {
            print("Process This Image with Seque");
            //Process the image and get the JSON response.
            // Call HTTP method to get the response. Use dummy instead for now.
            let responseJSON =  DummyResponseTagStruct(name: "SampleTagResponse").getDummyJsonResponse();
            var tagObject = DecorateHashTagResponse(jsonResponse: responseJSON);
            let navController = segue.destinationViewController as! UINavigationController
            let displaySuggestedTagResponse = navController.viewControllers[0] as! SuggestedHashTagViewController
            displaySuggestedTagResponse.tagResponseToShow = tagObject;
        }
    }
    

}
