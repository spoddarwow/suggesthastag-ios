//
//  MyPhotosViewController.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 10/10/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import Photos

class MyPhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,
    UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var photoCollectionView: UICollectionView!
    private var photoCollection =  [PHAsset]()
    var collection = PHFetchResult()
    var albumToShow = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if(albumToShow.characters.count > 0){
            self.title = albumToShow;
        }
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        self.photoCollection =  [PHAsset]()
        loadDevicePhotos();
        self.photoCollectionView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadDevicePhotos(){
        var photoFetchOptions = PHFetchOptions()
        
        let photoFetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: nil)
        photoFetchOptions = PHFetchOptions()
       // photoFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false )]
        collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: photoFetchOptions)
        if(albumToShow.characters.count > 0){
            collection.enumerateObjectsUsingBlock{ (object: AnyObject!, count: Int, stop: UnsafeMutablePointer) in
                if object is PHAssetCollection {
                    let obj:PHAssetCollection = object as! PHAssetCollection
                    if(self.albumToShow == obj.localizedTitle){
                        let photoFetchOptions = PHFetchOptions()
                        photoFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false )]
                        let collections = PHAsset.fetchAssetsInAssetCollection(obj, options: photoFetchOptions)
                        collections.enumerateObjectsUsingBlock{(object: AnyObject!,
                            count: Int,
                            stop: UnsafeMutablePointer<ObjCBool>) in
                            let asset = object as! PHAsset
                            self.photoCollection.append(asset)
                            print("_+_+_+")
                        }
                        print("-=-=-");
                        
                    }
                }
            }
        }else if(photoFetchResult.firstObject != nil &&  photoFetchResult.count > 0 ){
                photoFetchResult.enumerateObjectsUsingBlock{(object: AnyObject!,
                    count: Int,
                    stop: UnsafeMutablePointer<ObjCBool>) in
                        let asset = object as! PHAsset
                        self.photoCollection.append(asset)
                    }
            
        }else{
            self.photoCollection = [PHAsset]();
        }
        
    
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoCollection.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photosCollection", forIndexPath: indexPath) as! MyPhotoCollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        let imageToDisplay = self.photoCollection[indexPath.row] 
        cell.photoItem.image = getAssetThumbnail( imageToDisplay)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.synchronous = true
        manager.requestImageForAsset(asset, targetSize: CGSize(width: 100.0, height: 100.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "photoAlbumMenuPopup" {
            let navController = segue.destinationViewController as! UINavigationController
            let popoverViewController = navController.viewControllers[0] as! MyAlbumMenuTableViewController
            popoverViewController.labelString = "Hello Sumit";
            popoverViewController.albums = self.collection
            navController.modalPresentationStyle = UIModalPresentationStyle.Popover
            navController.popoverPresentationController!.delegate = self
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        else if segue.identifier == "viewChoosenPhoto" {
            print("Hello");
            let navController = segue.destinationViewController as! UINavigationController
            let displaySelectedImageController = navController.topViewController as! MyPhotoFinalStepViewController
            //let displaySelectedImageController =  segue.destinationViewController as! MyPhotoFInalStepViewController

            if let selectedPhotoCell = sender as? MyPhotoCollectionViewCell {
                displaySelectedImageController.image = selectedPhotoCell.photoItem.image
            }
           // presentViewController(displaySelectedImageController, animated: true, completion: nil)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func  getAlbumsCollection()-> PHFetchResult{
        return collection;
    }
    
    func reloadPhotoCollectionView(){
        
        
    }

}
