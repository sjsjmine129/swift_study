//
//  EditViewController.swift
//  Navigation
//
//  Created by 엄승주 on 1/11/24.
//

import UIKit

// protocol -> cast of function
protocol EditDelegate {
    // if we inherite, must make that function
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOff(_ controller: EditViewController, imgOnoff: Bool)
}

class EditViewController: UIViewController {
    
    // var for receive from navigation
    var textWayValue: String = ""
    var textMessage: String = ""
    // var for switch
    var ImgOn = false
    
    // for sending data to View controller -> setted as View controller
    var delegate : EditDelegate?
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMessage
        
        swOn.isOn = ImgOn
    }
    
    @IBAction func btndone(_ sender: UIButton) {
        if delegate != nil{
            // send message
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOff(self, imgOnoff: ImgOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            ImgOn = true
        }
        else {
            ImgOn = false
        }
    }
    
}
