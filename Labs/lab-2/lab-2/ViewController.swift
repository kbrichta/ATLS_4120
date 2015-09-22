//
//  ViewController.swift
//  lab-2
//
//  Created by Kelly Brichta on 9/15/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var virusImage: UIImageView!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var virusTitle: UILabel!
   

    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        virusTitle.font=UIFont.systemFontOfSize(fontSizeCGFloat)
    }
    
    @IBAction func pickVirus(sender: UISegmentedControl) {
        
        if imageControl.selectedSegmentIndex == 0 {
            virusImage.image=UIImage(named: "ebola-virus")
            virusTitle.text="Ebola"
        }
        
      else if imageControl.selectedSegmentIndex == 1 {
            virusImage.image=UIImage(named: "MERS-virus")
            virusTitle.text="MERS"
        }
        
        else if imageControl.selectedSegmentIndex == 2 {
            virusImage.image=UIImage(named: "SARS-virus")
            virusTitle.text="SARS"
        }
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

