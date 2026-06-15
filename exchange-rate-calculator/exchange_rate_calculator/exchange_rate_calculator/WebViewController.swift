import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    @IBAction func goNaver(_ sender: UIButton) {
        guard let url = URL(string: "https://m.naver.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
