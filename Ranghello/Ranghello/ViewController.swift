//
//  ViewController.swift
//  Ranghello
//
//  Created by 이하랑 on 10/28/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBAction func btnSend(_ sender: UIButton) {
        lbHello.text = "Hello, " + txtName.text!
        print(lbHello.text,txtName.text )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

