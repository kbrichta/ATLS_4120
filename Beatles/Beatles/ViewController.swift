//
//  ViewController.swift
//  Beatles
//
//  Created by Kelly Brichta on 9/10/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!

    
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize) //convert float to String
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat) //create a UIFont object and assign to the font property
    }
    
    func updateCaps(){
        if capitalSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        }
        else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBAction func updateFont(sender: UISwitch) {
       updateCaps()
    }
    
    func updateImage (){
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text="Young Beatles"
            beatlesImage.image=UIImage(named: "beatles1")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text="Not so young Beatles"
            beatlesImage.image=UIImage(named: "beatles2")
        }
    }
    
    @IBAction func changeInfo(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
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

