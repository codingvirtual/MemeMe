//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jason on 12/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class MemeDetailViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var meme: Meme?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.meme.text
        
        self.imageView!.image = UIImage(named: meme?.memedImage)
    }
    
    
}
