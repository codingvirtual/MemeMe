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
    
    let text: String
    let image: UIImage
    let memedImage: UIImage
    
    init(text: String, image: UIImage, memedImage: UIImage) {
        
        self.text = text
        self.image = image
        self.memedImage = memedImage
    }
}


/**
* This extension adds static variable allMemes. An array of Meme objects


extension Meme {
    
    // Generate an array full of all of the Memes in
    static var allMemes: [Meme] {
        
        var MemeArray = [Meme]()
        
        for d in Meme.localMemeData() {
            MemeArray.append(Meme(dictionary: d))
        }
        
        return MemeArray
    }
    
    static func localMemeData() -> [[String : String]] {
        return [
            [Meme.TextKey : "Mr. Big", Meme.ImageKey : "Smuggle herion.",  Meme.MemedImageKey : "Big"],
            [Meme.TextKey : "Ernest Blofeld", Meme.ImageKey : "Many, many, schemes.",  Meme.MemedImageKey : "Blofeld"],
            [Meme.TextKey : "Sir Hugo Drax", Meme.ImageKey : "Nerve gass Earth, from the Moon.",  Meme.MemedImageKey : "Drax"],
            [Meme.TextKey : "Jaws", Meme.ImageKey : "Kill Bond with huge metal teeth.",  Meme.MemedImageKey : "Jaws"],
            [Meme.TextKey : "Rosa Klebb", Meme.ImageKey : "Humiliate MI6",  Meme.MemedImageKey : "Klebb"],
            [Meme.TextKey : "Emilio Largo", Meme.ImageKey : "Steal nuclear weapons", Meme.MemedImageKey : "EmilioLargo"],
            [Meme.TextKey : "Le Chiffre", Meme.ImageKey : "Beat bond at poker.",  Meme.MemedImageKey : "Lechiffre"],
            [Meme.TextKey : "Odd Job", Meme.ImageKey : "Kill Bond with razor hat.",  Meme.MemedImageKey : "OddJob"],
            [Meme.TextKey : "Francisco Scaramanga", Meme.ImageKey : "Kill Bond after assembling a golden gun.",  Meme.MemedImageKey : "Scaramanga"],
            [Meme.TextKey : "Raoul Silva", Meme.ImageKey : "Kill M.",  Meme.MemedImageKey : "Silva"],
            [Meme.TextKey : "Alec Trevelyan", Meme.ImageKey : "Nuke London, after killing Bond.",  Meme.MemedImageKey : "Trevelyan"],
            [Meme.TextKey : "Auric Goldfinger", Meme.ImageKey : "Nuke Fort Knox.",  Meme.MemedImageKey : "Goldfinger"],
            [Meme.TextKey : "Max Zorin", Meme.ImageKey : "Destroy Silicon Valley with an earthquake and flood.",  Meme.MemedImageKey : "Zorin"]
        ]
    }
}

*/