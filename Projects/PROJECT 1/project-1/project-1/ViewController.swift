//
//  ViewController.swift
//  project-1
//
//  Created by Kelly Brichta on 9/29/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
   
//START audio
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
    }
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
    }
    func audioPlayerBeginInterruption(player: AVAudioPlayer!) {
    }
    func audioPlayerEndInterruption(player: AVAudioPlayer!) {
    }
    
    var audioPlayer: AVAudioPlayer?

    @IBAction func playAudio(sender: UIButton) {
        if let player = audioPlayer {
            player.play()
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        if let player = audioPlayer {
            player.stop()
        }
    }
//END audio
    
//START guesses
    
//text fields
    @IBOutlet weak var userTextZero: UITextField!
    @IBOutlet weak var userTextOne: UITextField!
    @IBOutlet weak var userTextTwo: UITextField!
    @IBOutlet weak var userTextThree: UITextField!

    
    @IBOutlet weak var imageGuessFeedbackZero: UIImageView!
    @IBOutlet weak var imageGuessFeedbackOne: UIImageView!
    @IBOutlet weak var imageGuessFeedbackTwo: UIImageView!
    @IBOutlet weak var imageGuessFeedbackThree: UIImageView!
    
    
    
    
    @IBAction func submitGuesses(sender: AnyObject) {
        if userTextZero.text == "estrela" {
            imageGuessFeedbackZero.image=UIImage(named: "correctAnswer")
        }
        else { imageGuessFeedbackZero.image=UIImage(named: "wrongAnswer")}
        
        if userTextOne.text == "Quiçá" {
            imageGuessFeedbackOne.image=UIImage(named: "correctAnswer")
        }
        else {imageGuessFeedbackOne.image=UIImage(named: "wrongAnswer")}
        
        if userTextTwo.text == "gerar" {
            imageGuessFeedbackTwo.image=UIImage(named: "correctAnswer")
        }
        else {imageGuessFeedbackTwo.image=UIImage(named: "wrongAnswer")}
        
        if userTextThree.text == "que" {
            imageGuessFeedbackThree.image=UIImage(named: "correctAnswer")
        }
        else {imageGuessFeedbackThree.image=UIImage(named: "wrongAnswer")}
    }
    
    
//END guesses

//START clues
//clue buttons
    @IBOutlet weak var clueBox: UILabel!

    @IBAction func getClueZero(sender: UIButton) {
        if sender.tag==0{
            clueBox.text="Olha no ceu na noite e você vai ver isso."
        }
    }
    @IBAction func getClueOne(sender: UIButton) {
        if sender.tag==1{
            clueBox.text="Talvez..."
        }
    }
    @IBAction func getClueTwo(sender: UIButton) {
        if sender.tag==2{
            clueBox.text="produzir"
        }
    }
    @IBAction func getClueThree(sender: UIButton) {
        if sender.tag==3{
            clueBox.text="O ___ é isso?"
        }
    }
//END clues
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//START audio
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("SINA - DJAVAN", ofType: "mp3")!)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if let err = error {
            println("audioPlayer error \(err.localizedDescription)")
        } else {
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        }
//END audio
    }
        // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func backgroundTap(sender: UIControl) {
        userTextZero.resignFirstResponder()
        userTextOne.resignFirstResponder()
        userTextTwo.resignFirstResponder()
        userTextThree.resignFirstResponder()
    }
    
}

