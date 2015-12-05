//
//  CameraViewController
//  Suggest #Tag
//
//  Created by Sumit Poddar on 10/10/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        imagePicker.delegate = self
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            //magePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let alertVC = UIAlertController(title: "No Camera",message: "Sorry, this device has no camera",
                preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK",style:.Default,handler: noCameraAlertOk)
            alertVC.addAction(okAction)
            presentViewController(alertVC,animated: true,completion: nil)
        }
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("Camera Cancelled");
        self.dismissViewControllerAnimated(true, completion: nil)
        slideTabOnAction(0);
    }
    
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Image Picked");
        UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navController = storyboard.instantiateViewControllerWithIdentifier("viewChoosenPhotoNavIdendifier") as! UINavigationController
        navController.delegate = self
        let displaySelectedImageController = navController.topViewController as! MyPhotoFinalStepViewController
        displaySelectedImageController.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        presentViewController(navController, animated: true, completion: nil)
        
        
    }
    
    func image(image: UIImage, didFinishSavingWithError
        error: NSErrorPointer, contextInfo:UnsafePointer<Void>) {
            
            if error != nil {
                print("Error saving the image. Please try again.");
                let alertVC = UIAlertController(title: "Error",message: "Sorry, there is some error saving your picture.",
                    preferredStyle: .Alert)
                let tryAgainAction = UIAlertAction(title: "Try Again",style:.Default,handler: tryAgainHandler)
                let cancelAction = UIAlertAction(title: "Cancel",style:.Default,handler: noCameraAlertOk)
                alertVC.addAction(tryAgainAction)
                alertVC.addAction(cancelAction)
                presentViewController(alertVC,animated: true,completion: nil)
            }
    }
    
    func noCameraAlertOk(alert: UIAlertAction!){
        slideTabOnAction(0);
    }
    
    func tryAgainHandler(alert: UIAlertAction!){
        viewDidLoad()
    }
    
    func slideTabOnAction(index:NSInteger ){
        self.tabBarController!.selectedIndex = index;
    }
}
