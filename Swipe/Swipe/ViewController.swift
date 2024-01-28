//
//  ViewController.swift
//  Swipe
//
//  Created by 엄승주 on 1/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgUp: UIImageView!
    @IBOutlet var imgLeft: UIImageView!
    @IBOutlet var imgRight: UIImageView!
    @IBOutlet var imgDown: UIImageView!
    
    let numberOfTouch = 2
    
    var left = [UIImage]()
    var right = [UIImage]()
    var up = [UIImage]()
    var down = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        left.append(UIImage(named: "arrow-left-black.png")!)
        left.append(UIImage(named: "arrow-left-red.png")!)
        right.append(UIImage(named: "arrow-right-black.png")!)
        right.append(UIImage(named: "arrow-right-red.png")!)
        up.append(UIImage(named: "arrow-up-black.png")!)
        up.append(UIImage(named: "arrow-up-red.png")!)
        down.append(UIImage(named: "arrow-down-black.png")!)
        down.append(UIImage(named: "arrow-down-red.png")!)
        
        
        up.append(UIImage(named: "arrow-up-green.png")!)
        down.append(UIImage(named: "arrow-down-green.png")!)
        left.append(UIImage(named: "arrow-left-green.png")!)
        right.append(UIImage(named: "arrow-right-green.png")!)
        
        imgUp.image = up[0]
        imgDown.image = down[0]
        imgLeft.image = left[0]
        imgRight.image = right[0]
        
        // one touch
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        // two touch
        let swipeUpDouble = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestureDouble(_:)))
        swipeUpDouble.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpDouble.numberOfTouchesRequired = numberOfTouch
        self.view.addGestureRecognizer(swipeUpDouble)
        
        let swipeDownDouble = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestureDouble(_:)))
        swipeDownDouble.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownDouble.numberOfTouchesRequired = numberOfTouch
        self.view.addGestureRecognizer(swipeDownDouble)
        
        let swipeLeftDouble = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestureDouble(_:)))
        swipeLeftDouble.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftDouble.numberOfTouchesRequired = numberOfTouch
        self.view.addGestureRecognizer(swipeLeftDouble)
        
        let swipeRightDouble = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestureDouble(_:)))
        swipeRightDouble.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightDouble.numberOfTouchesRequired = numberOfTouch
        self.view.addGestureRecognizer(swipeRightDouble)
    }
    
    @objc func swipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgUp.image = up[0]
            imgDown.image = down[0]
            imgLeft.image = left[0]
            imgRight.image = right[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgUp.image = up[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgDown.image = down[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgLeft.image = left[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgRight.image = right[1]
            default:
                break
            }
        }
    }

    @objc func swipeGestureDouble(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgUp.image = up[0]
            imgDown.image = down[0]
            imgLeft.image = left[0]
            imgRight.image = right[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgUp.image = up[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgDown.image = down[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgLeft.image = left[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgRight.image = right[2]
            default:
                break
            }
        }
    }
    
}

