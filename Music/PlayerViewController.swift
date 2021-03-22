//
//  PlayerViewController.swift
//  Music
//
//  Created by LIU SHANG WEI on 2021/3/19.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var forwardImageView: UIImageView!
    @IBOutlet weak var playImageView: UIImageView!
    let player = AVPlayer()
    var currentSong = ""
    @objc func play(sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        let x = Int(point.x)
        let y = Int(point.y)
        if player.timeControlStatus == .playing {
            playImageView.image = UIImage(systemName: "pause")
        }
        //按下play/pause鍵
        if (x >= 147 && x <= 223) && (y >= 440 && y <= 512) {
            if player.timeControlStatus == .playing {
                player.pause()
                playImageView.image = UIImage(systemName: "play")
            } else {
                player.play()
                playImageView.image = UIImage(systemName: "pause")
            }
        }
        //下一首
        if (x >= 256 && x <= 332) && (y >= 440 && y <= 512) && (currentSong == "drunk") {
            let fileUrl = Bundle.main.url(forResource: "small-bump", withExtension: "mp3")!
            let playerItem = AVPlayerItem(url: fileUrl)
            player.replaceCurrentItem(with: playerItem)
            currentSong = "small-bump"
            singerImageView.image = UIImage(named: "small-bump")
            songLabel.text = "small-bump"
            player.play()
            
        }
        //上一首
        if (x >= 42 && x <= 118) && (y >= 440 && y <= 512) && (currentSong == "small-bump") {
            let fileUrl = Bundle.main.url(forResource: "drunk", withExtension: "mp3")!
            let playerItem = AVPlayerItem(url: fileUrl)
            player.replaceCurrentItem(with: playerItem)
            currentSong = "drunk"
            singerImageView.image = UIImage(named: "drunk")
            songLabel.text = "drunk"
            player.play()
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileUrl = Bundle.main.url(forResource: "drunk", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        currentSong = "drunk"
        player.play()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(play))
        view.addGestureRecognizer(tap)
    }

    
}
