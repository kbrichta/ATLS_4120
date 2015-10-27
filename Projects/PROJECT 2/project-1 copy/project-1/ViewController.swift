//
//  ViewController.swift
//  project-1
//
//  Created by Kelly Brichta on 9/29/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//START youtube
    @IBOutlet weak var webView: UIWebView!
//END youtube
    
//START persistence
    @IBOutlet var lineFields:[UITextField]!
    private let rootKey = "rootKey"
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = paths[0] as! NSString
        return documentsDirectory.stringByAppendingPathComponent("data.archive") as String
    }
    
    func applicationWillResignActive(notification:NSNotification) {
        let filePath = self.dataFilePath()
        
        let guessLines = GuessLines()
        let array = (self.lineFields as NSArray).valueForKey("text") as! [String]
        guessLines.lines = array
        
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(guessLines, forKey: rootKey)
        archiver.finishEncoding()
        data.writeToFile(filePath, atomically: true)
    }
//END persistence
    
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
        
        //START YouTube
        self.view.addSubview(webView)
        self.view.bringSubviewToFront(webView)
        
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        
        let videoID = "uD2gS0IBs3E" // https://www.youtube.com/watch?v=
        
        let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='http://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='340' height='170' src='http://www.youtube.com/embed/\(videoID)?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'></body></html>"
        
        webView.loadHTMLString(embededHTML, baseURL: NSBundle.mainBundle().resourceURL)
        //RESOURCE: http://stackoverflow.com/questions/29245935/play-embedded-youtube-video-in-ios-app-not-full-screen
        //END YouTube
        
        
        //START persistence
        let filePath = self.dataFilePath()
        if (NSFileManager.defaultManager().fileExistsAtPath(filePath)) {
            
            let data = NSMutableData(contentsOfFile: filePath)!
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
            let guessLines = unarchiver.decodeObjectForKey(rootKey) as! GuessLines
            unarchiver.finishDecoding()
            
            if let newLines = guessLines.lines {
                for var i = 0; i < newLines.count; i++ {
                    lineFields[i].text = newLines[i]
                }
            }
            
        }
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: app)
        //END persistence
        
        super.viewDidLoad()
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

