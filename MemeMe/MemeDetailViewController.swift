//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Greg Palen on 7/27/15.
//  Copyright (c) 2015 codingvirtual. All rights reserved.
//

import Foundation

import UIKit

class MemeDetailViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.imageView!.image = meme!.memedImage
    }
}
