//
//  ViewController.swift
//  MAD-midterm
//
//  Created by Kelly Brichta on 10/29/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var transportImage: UIImageView!
    
    @IBOutlet weak var commuteMiles: UITextField!
    @IBOutlet weak var commuteTimeTotal: UILabel!
    @IBOutlet weak var purchaseGas: UILabel!
    
    //START choose image
    @IBAction func chooseTransport(sender: UISegmentedControl) {
        
        if imageControl.selectedSegmentIndex == 0 {
            transportImage.image=UIImage(named: "car")
            
            //START alert
            let alert=UIAlertController(title: "Did you know...", message: "If you drive, you can save money and gas by carpooling?", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
            //END alert
        }
        
            if imageControl.selectedSegmentIndex == 1 {
                transportImage.image=UIImage(named: "bus")
        }
        
                if imageControl.selectedSegmentIndex == 2 {
                    transportImage.image=UIImage(named: "bike")
                }
        }
    //END choose image
    
    //START slider
    @IBOutlet weak var gasAmount: UILabel!
    @IBAction func changeGas(sender: UISlider) {
        let gas=sender.value
        gasAmount.text=String(format: "%.0f" + " gallons", gas)
    }
    //END slider
    
    //START commute time
    @IBAction func commuteTime(sender: UIButton) {
    let milesTotal=commuteMiles.text.toInt()
    let timeTotal=milesTotal!/20
    let totalGas=milesTotal!/24
    
    commuteTimeTotal.text="\(timeTotal)" + " hours"
    
    purchaseGas.text="\(totalGas)" + " gallons"
        
    }
    //END commute time

    

    override func viewDidLoad() {
        
        commuteMiles.delegate=self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}