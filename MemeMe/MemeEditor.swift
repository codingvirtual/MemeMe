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

class MemeEditor: UIViewController {
    
    var meme: Meme?
    
    @IBOutlet var imageView : UIImageView?
    @IBOutlet var topText: UITextField?
    @IBOutlet var bottomText: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showImagePicker() {
        let nextController = UIImagePickerController()
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    
    @IBAction func showShare() {
        let controller = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func showAlert() {
        let controller = UIAlertController()
        controller.title = "This is a test"
        controller.message = "Here's an alert"
        controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in self.dismissViewControllerAnimated(true, completion: nil) })
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

