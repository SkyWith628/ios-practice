//
//  VideoViewController.swift
//  BMI
//
//  Created by 이하랑 on 11/18/25.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func playVideo(_ sender: UIButton) {
                let videoPath: String? = Bundle.main.path(forResource: "bmi", ofType: "mp4")
        let videoURL = URL(filePath: videoPath!)
        let player = AVPlayer(url: videoURL)
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true)
        player.play()
    }
}
