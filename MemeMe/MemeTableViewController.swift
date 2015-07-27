//
//  ViewController.swift
//
//  Created by Jason on 11/19/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes: [Meme]!
    
    // MARK: Table View Data Source
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell") as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.memeText!.text = meme.topText + meme.bottomText
        cell.memeImageView!.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
