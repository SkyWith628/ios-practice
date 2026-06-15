
import UIKit
import AVKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playVideo(_ sender: UIButton) {
    
        guard let videoPath = Bundle.main.path(forResource: "bmi", ofType: "mp4") else {
            print("📛 ERROR: bmi.mp4 파일을 찾을 수 없습니다.")
            return
        }

        let videoURL = URL(fileURLWithPath: videoPath)
        let player = AVPlayer(url: videoURL)

        let playerController = AVPlayerViewController()
        playerController.player = player

        present(playerController, animated: true) {
            player.play()
        }
    }
}
