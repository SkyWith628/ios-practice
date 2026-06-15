//
//  WebViewController.swift
//  BMI
//
//  Created by 이하랑 on 11/25/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func goNAVER(_ sender: UIButton) {
        guard let url = URL(string: "https://github.com/SkyWith628") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

}
