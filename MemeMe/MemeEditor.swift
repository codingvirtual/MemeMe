//
//  MemeEditor.swift
//  MemeMe
//
//  Created by Greg Palen on 7/26/15.
//  Copyright (c) 2015 codingvirtual. All rights reserved.
//

import UIKit

//
//  ViewController.swift
//  Experiment
//
//  Created by Greg Palen on 7/26/15.
//  Copyright (c) 2015 codingvirtual. All rights reserved.
//

import UIKit

class MemeEditor: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var imageView : UIImageView?
    @IBOutlet var topText: UITextField?
    @IBOutlet var bottomText: UITextField?
    @IBOutlet var cameraButton: UIBarButtonItem?
    @IBOutlet var navBar: UINavigationBar?
    @IBOutlet var toolBar: UIToolbar?
    @IBOutlet var snapshotView: UIView?
    
    var memeTextAttributes: NSDictionary?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : -2.0
        ]
        topText!.defaultTextAttributes = memeTextAttributes
        bottomText!.defaultTextAttributes = memeTextAttributes
        topText!.textAlignment = NSTextAlignment.Center
        bottomText!.textAlignment = NSTextAlignment.Center
        // Subscribe to keyboard notifications to allow the view to raise when necessary
        self.subscribeToKeyboardNotifications()
        cameraButton!.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
 
    // Unsubscribe
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if bottomText!.isFirstResponder() {
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    @IBAction func pickAnImageFromAlbum (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as! UIImage! {
            self.imageView!.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func showShare() {
        let controller = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        controller.completionWithItemsHandler = saveAndExit
        self.presentViewController(controller, animated: true, completion: nil)
    }

    func generateMemedImage() -> UIImage {
        // render view to an image
        self.navBar?.hidden = true
        self.toolBar?.hidden = true
        UIGraphicsBeginImageContext(self.view!.frame.size)

        self.snapshotView!.drawViewHierarchyInRect(self.snapshotView!.frame, afterScreenUpdates: true)
        
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navBar?.hidden = false
        self.toolBar?.hidden = false
        
        return memedImage
    }
    
    func save() {
        //Create the meme
        var meme = Meme( topText: topText!.text!, bottomText: bottomText!.text!, image:
            imageView!.image!, memedImage: generateMemedImage())
        
        // Add it to the memes array in the Application Delegate
        (UIApplication.sharedApplication().delegate as!
            AppDelegate).memes.append(meme)
    }
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveAndExit(activityType: String!, completed: Bool, returnedItems: [AnyObject]!, error: NSError!) {
        // Return if cancelled
        if (!completed) {
            cancel()
        }
        save();
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

