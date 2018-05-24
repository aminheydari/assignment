//
//  PlayerViewController.swift
//  toolkit_assignment_2_final
//
//  Created by AMIN HEYDARI on 17/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit
// import AVFoundation to have this ability to play a music
import AVFoundation

class PlayerViewController: UIViewController {
    
    // I had made the out let for cover image, prgress view, song title, and artist name
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // track Id variables and variables to play audio which is AVAudioPlayer!
    var trackId: Int = 0
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I assign the cover image view, song's title and artist's name from library here

        if let coverImage = library[trackId]["coverImage"]{
            coverImageView.image = UIImage(named: "\(coverImage).jpg")
        }
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        // here I get a path over songs
        
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
        
        // here I create a mp3 URL and for using my audio player
        
        if let path = path {
            let mp3URL = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                audioPlayer.play()
                
                // here I put the track to time progration which move every one second
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                
                // If any error happend I see error according to this part
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
    // this function for updating progress view 
    
    func updateProgressView(){
        
        if audioPlayer.isPlaying {
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
        
    }
    
    // function for play button 
    
    @IBAction func playAction(_ sender: Any) {
        
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
        
        
    }
    
    // function for stop button and reset all information such as current time and progress view
    
    @IBAction func stopAction(_ sender: Any) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        progressView.progress = 0
        
    }
    
    // function for pause button
    
    @IBAction func pauseAction(_ sender: Any) {
        
        audioPlayer.pause()
        
    }
    
    // function for fastforward button
    
    @IBAction func fastForwardAction(_ sender: Any) {
        
        // here I create a variable for time
        
        var time: TimeInterval = audioPlayer.currentTime
        
        // when user click on button the time will pass for 5 seconds
        
        time += 5.0
        
        // if user press fastforward button till end of the song duration stop action will run automatically
        
        if time > audioPlayer.duration {
            stopAction(self)
        }else {
            audioPlayer.currentTime = time
        }
        
    }
    
    // function for rewindAction button
    
    @IBAction func rewindAction(_ sender: Any) {
        
        // here I create a variable for time
        
        var time: TimeInterval = audioPlayer.currentTime
        
        // when user click on button the time will back for 5 seconds
        
        time -= 5.0
        
        // if user press rewindAction button till first of the song, stop action will run automatically
        
        if time < 0 {
            stopAction(self)
        }else {
            audioPlayer.currentTime = time
        }
        
    }
    
    // I create a function for Previous button
    
    @IBAction func previousAction(_ sender: Any) {
        
        // first check if it is not the first song
        
        if trackId != 0 || trackId > 0 {
            
            // if it is not the first one back to previous song
            
            trackId -= 1
            
            // these codes are same as above code for change the information in current page!
            
            if let coverImage = library[trackId]["coverImage"]{
                coverImageView.image = UIImage(named: "\(coverImage).jpg")
            }
            
            songTitleLabel.text = library[trackId]["title"]
            artistLabel.text = library[trackId]["artist"]
            
            audioPlayer.currentTime = 0
            progressView.progress = 0
            
            let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
            
            if let path = path {
                let mp3URL = URL(fileURLWithPath: path)
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                    progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        // first check if it is not the last song
        
        if trackId == 0 || trackId < 4 {
            
            // if it is not the last one pass to next song
            
            trackId += 1
            
            // these codes are same as above code for change the information to new information in current page!
            
            if let coverImage = library[trackId]["coverImage"]{
                coverImageView.image = UIImage(named: "\(coverImage).jpg")
            }
            
            songTitleLabel.text = library[trackId]["title"]
            artistLabel.text = library[trackId]["artist"]
            
            audioPlayer.currentTime = 0
            progressView.progress = 0
            
            let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
            
            if let path = path {
                let mp3URL = URL(fileURLWithPath: path)
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                    progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
