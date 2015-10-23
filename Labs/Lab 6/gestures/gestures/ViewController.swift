//
//  ViewController.swift
//  gestures
//
//  Created by Kelly Brichta on 10/13/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func handleLongPress(sender: UILongPressGestureRecognizer) {
    let audioFilePath = NSBundle.mainBundle().pathForResource("Psycho_Full_Violin_Screech", ofType: "mp3")
    let fileURL = NSURL(fileURLWithPath: audioFilePath!)
    audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        if audioPlayer != nil{
        audioPlayer!.play()
        }
    }
    
    @IBAction func handlePinch(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation=0
        
    }
    
    @IBAction func handleRotate(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale=1
    }
    
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        //returns the new location
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        //set the translation back to 0
        sender.setTranslation(CGPointZero, inView: view)
        
        //when the move ends...
        if sender.state == UIGestureRecognizerState.Ended {
        //figure out the velocity
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude/200
            
        //if the length is <200, then decrease the base speed, otherwise increase it
            //increase for a greater slide
            let slideFactor = 0.1 * slideMultiplier
            
        //calculate a final point based on the velocity and the slideFactor
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor), y:sender.view!.center.y + (velocity.y * slideFactor))
            
        //make sure the final point is within the view's bounds
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
        //animate the view
            UIView.animateWithDuration(Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {sender.view!.center = finalPoint}, completion: nil)
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
