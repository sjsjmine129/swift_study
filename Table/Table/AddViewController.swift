//
//  AddViewController.swift
//  Table
//
//  Created by 엄승주 on 1/12/24.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var tfAdditem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAdditem.text!)
        itemImageFile.append("clock.png")
        tfAdditem.text = ""
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}
