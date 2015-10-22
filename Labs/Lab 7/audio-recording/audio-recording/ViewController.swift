//
//  ViewController.swift
//  audio-recording
//
//  Created by Kelly Brichta on 10/15/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.caf"
    
    @IBAction func recordAudio(sender: UIButton) {
        //if not already recording, start recording
        if audioRecorder?.recording == false {
            playButton.enabled = false
            stopButton.enabled = true
            audioRecorder?.record()
        }
    }
    
    @IBAction func playAudio(sender: UIButton) {
        //if not recording play audio file
        if audioRecorder?.recording == false {
            stopButton.enabled = true
            recordButton.enabled = false
            var error: NSError?
            
            //create the AVAusioPlayer instance
            audioPlayer=AVAudioPlayer(contentsOfURL: audioRecorder?.url, error: &error)

            //test for error
            if let err = error {
                println("AVAudioPlayer error: \(err.localizedDescription)")
            } else {
                //sets the delegate
                audioPlayer?.delegate=self
                //plays the audio
                audioPlayer?.play()
            }
        }
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        stopButton.enabled = false
        playButton.enabled = true
        recordButton.enabled = true
        //stop recording or playing
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        recordButton.enabled = true
        stopButton.enabled = false
    }
    
    override func viewDidLoad() {
        //dsable buttons since no audio has been recovered
        playButton.enabled = false;
        stopButton.enabled = false;
        
        //get path for the audio file
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        //documents directory
        let docDir = dirPath[0] as! String
        let audioFilePath = docDir.stringByAppendingPathComponent(fileName)
        //URL to the audio file
        let audioFileURL = NSURL (fileURLWithPath: audioFilePath)
        
        //recorder settings
        //NSDictionary for settings
        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.Min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0]
        var error: NSError?
        
        //create the AVAudioRecorder instance
        audioRecorder = AVAudioRecorder(URL: audioFileURL, settings: recordSettings as [NSObject : AnyObject], error: &error)
        
        //test for error
        if let err = error {
            println("AVAudioRecorder error: \(err.localizedDescription)")
        } else {
            //no error
            //sets the delegate
            audioRecorder?.delegate = self
            //ready to record
            audioRecorder?.prepareToRecord()
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

