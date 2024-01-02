//
//  ViewController.swift
//  Alert
//
//  Created by 엄승주 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "santa.png")
    let imgOff = UIImage(named: "santa_2.png")
    let imgDelete = UIImage(named: "4.JPEG")
    
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }
    
    //켜기
    @IBAction func btnTurnOn(_ sender: UIButton) {
        if(isLampOn == true){
            let lampOnAlert = UIAlertController(title: "Alert", message: "The santa is already on", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Check", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        else{
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    
    //끄기
    @IBAction func btnTurnOff(_ sender: UIButton) {
        if (isLampOn){
            let lampOffAlert = UIAlertController(title: "Turn Off", message: "Turn off the santa?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Off", style: UIAlertAction.Style.default, handler: {
                Action in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(cancelAction)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
            
        }
        else{
            let lampOffAlert = UIAlertController(title: "Alert", message: "The santa is already off", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Check", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    //제거
    @IBAction func btnDelete(_ sender: UIButton) {
        let lampDeleteAlert = UIAlertController(title: "Delete Santa", message: "Delete santa?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "No, turn off", style: UIAlertAction.Style.default, handler: {
            Action in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "No, turn on", style: UIAlertAction.Style.default, handler: {
            Action in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let cancelAction = UIAlertAction(title: "Delete Santa", style: UIAlertAction.Style.default, handler: {
            Action in self.lampImg.image = self.imgDelete
            self.isLampOn = false
        })
        
        lampDeleteAlert.addAction(offAction)
        lampDeleteAlert.addAction(onAction)
        lampDeleteAlert.addAction(cancelAction)
        
        present(lampDeleteAlert, animated: true, completion: nil)
    }
    
}

