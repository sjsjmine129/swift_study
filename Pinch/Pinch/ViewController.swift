//
//  ViewController.swift
//  Pinch
//
//  Created by 엄승주 on 1/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    
    var initialFontSize : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch (_ pinch: UIPinchGestureRecognizer){
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }


}

