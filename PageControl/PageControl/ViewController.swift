//
//  ViewController.swift
//  PageControl
//
//  Created by 엄승주 on 1/10/24.
//

import UIKit

var images = [ "IMG_0654.JPEG", "IMG_8872.JPG", "IMG_9096.PNG" ]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set number of page control
        pageControl.numberOfPages = images.count
        // set initial page
        pageControl.currentPage = 0
        // set color
        pageControl.pageIndicatorTintColor = UIColor.red
        // set first image
        imgView.image = UIImage(named: images[0])
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

