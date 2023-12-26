//
//  ViewController.swift
//  HelloWorld
//
//  Created by 엄승주 on 12/20/23.
//

import UIKit

class ViewController: UIViewController {
// means outlet IB = interface builder  : control the attribute of class
    @IBOutlet var lbHello: UILabel! // outlet variable (type : UILable)
    @IBOutlet var txtNameInput: UITextField! // input variable
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// control event.  function name      event source
    @IBAction func btnSendInputName(_ sender: UIButton) {
        lbHello.text = "Hello, " + txtNameInput.text!
    }
    
    
    
}

