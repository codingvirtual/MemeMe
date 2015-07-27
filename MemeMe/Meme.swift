//
//  Meme.swift
//  BondMemes
//
//  Created by Jason on 11/19/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit


struct Meme {
    
    let topText: String
    let bottomText: String
    let image: UIImage
    let memedImage: UIImage
    
    init(topText: String, bottomText: String, image: UIImage, memedImage: UIImage) {
        
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
    }
    
    init(topText: String, bottomText: String) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = UIImage(named: "big")!
        self.memedImage = UIImage(named: "big")!
    }
}
