//
//  ViewController.swift
//  Navigation
//
//  Created by 엄승주 on 1/11/24.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "santa.png")
    let imgOff = UIImage(named: "santa_2.png")
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgOn
    }
    
    // when navigate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // directly change the var of EditViewController
        
        // editViewController is real edit view controller
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //navigate by button
            editViewController.textWayValue = "Use Button"
        }
        else if segue.identifier == "editBarButton"{
            //navigate bu bar button
            editViewController.textWayValue = "Use Bar Button"
        }
        
        // set editer controller's delegate as self(ViewController)
        editViewController.delegate = self
        
        editViewController.ImgOn = isOn
        editViewController.textMessage = txMessage.text!
    }

    //set functions of 
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        //set got message as text field
        txMessage.text = message
    }
    
    
    func didImageOnOff(_ controller: EditViewController, imgOnoff: Bool) {
        if imgOnoff {
            imgView.image = imgOn
            isOn = true
        }
        else {
            imgView.image = imgOff
            isOn = false
        }
    }

}

