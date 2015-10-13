//
//  ViewController.swift
//  lab-4
//
//  Created by Kelly Brichta on 10/13/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderLabel: UILabel!

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var imageView: UIImageView!

    
    //initialize the delta to move 12 px horizontally, 4 px vertically
    var delta = CGPointMake(12, 4)
    //radius of the ball image
    var ballRadius = CGFloat()
    //animation timer
    var timer = NSTimer()
    
    //specifies how many pixels the image will move
    var translation = CGPointMake(0.0, 0.0)
    
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    //changes the position of imageView
    func moveImage() {
        
        let duration=Double(slider.value)
        UIView.beginAnimations("basketball", context: nil)
        UIView.animateWithDuration(duration, animations: {
            
        //self.imageView.center=CGPointMake(self.imageView.center.x + self.delta.x, self.imageView.center.y + self.delta.y
        self.imageView.transform=CGAffineTransformMakeTranslation(self.translation.x, self.translation.y)
            //sets transform to CFAffineTransform
            self.translation.x += self.delta.x
            self.translation.y += self.delta.y
        })
        UIView.commitAnimations()
        
        if imageView.center.x + translation.x > self.view.bounds.size.width - ballRadius || imageView.center.x + translation.x < ballRadius{
            delta.x = -delta.x
        }
        if imageView.center.y + translation.y > self.view.bounds.size.height - ballRadius || imageView.center.y + translation.x < ballRadius {
            delta.y = -delta.y
        }
    }
    
    //updates the timer and label with the current slider value
    @IBAction func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        //ball radius in half the width of the image
        changeSliderValue()
        ballRadius=imageView.frame.size.width/2
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

