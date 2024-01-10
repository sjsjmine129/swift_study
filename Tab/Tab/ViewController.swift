//
//  ViewController.swift
//  Tab
//
//  Created by 엄승주 on 1/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNavSanta(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnNavDataPicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

