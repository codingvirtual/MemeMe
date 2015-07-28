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
    var memeTextAttributes: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : 2.0
        ]
        topText!.defaultTextAttributes = memeTextAttributes
        bottomText!.defaultTextAttributes = memeTextAttributes
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
        self.presentViewController(controller, animated: true, completion: nil)
    }

    func generateMemedImage() -> UIImage {
        // render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
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
}

