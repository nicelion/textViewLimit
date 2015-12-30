//
//  ViewController.swift
//  textViewLimit
//
//  Created by Ian Thompson on 12/29/15.
//  Copyright © 2015 Nice Lion Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var tweetTextView: UITextView!
    
    @IBOutlet var charsLeftLabel: UILabel!
    
    @IBOutlet var tweetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        charsLeftLabel.text = "140"
        
        
        
        
        
    }

   
    func checkRemainingChars() {
        
        let allowedChars = 140
        
        let charsInTextView = -tweetTextView.text.characters.count
        
        let remainingChars = allowedChars + charsInTextView
        
        
        if remainingChars <= allowedChars {
            
            charsLeftLabel.textColor = UIColor.blackColor()
            
        }
        
        if remainingChars <= 20 {
            
            charsLeftLabel.textColor = UIColor.orangeColor()
            
        }
        
        if remainingChars <= 10 {
            
            charsLeftLabel.textColor = UIColor.redColor()
        }
        
        
        charsLeftLabel.text = String(remainingChars)
        
        
    }
    
    func textViewDidChange(textView: UITextView) {
        
        checkRemainingChars()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        
    }

    @IBAction func tweetButtonClicked(sender: AnyObject) {
        
        let allowedChars = 140
        
        let charsInTextView = -tweetTextView.text.characters.count
        
        let remainingChars = allowedChars + charsInTextView
        
        
        if remainingChars < 0 {
            
            let alert = UIAlertController(title: "Too Many Words in Tweet!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok.", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Tweet has been posted!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Yay.", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        
    }

}

