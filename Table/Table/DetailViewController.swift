//
//  DetailViewController.swift
//  Table
//
//  Created by 엄승주 on 1/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    func getData(_ item: String){
        receiveItem = item
    }

}
