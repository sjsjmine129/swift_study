//
//  ViewController.swift
//  ImageView
//
//  Created by 엄승주 on 12/26/23.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    // method is called after the view controller has loaded its view hierarchy into memory but before the view is presented on the screen.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize images
        imgOn = UIImage(named: "santa.png")
        imgOff = UIImage(named: "santa_2.png")
        imgView.image  = imgOn
    }

    //resize button function
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    //switch function
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
    
    
}

