//
//  ViewController.swift
//  DatePicker
//
//  Created by 엄승주 on 12/27/23.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector  = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var setTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timer                 interval of reset    where to run   functions to run
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        setTime = formatter.string(from: datePickerView.date)
        
        if (formatter.string(from: NSDate() as Date) == setTime ){
            view.backgroundColor = UIColor.blue
        }
        else{
            view.backgroundColor = UIColor.white
        }
    }
    
    //call when the time is change in second
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        if (formatter.string(from: date as Date) == setTime ){
            view.backgroundColor = UIColor.blue
        }
        else{
            view.backgroundColor = UIColor.white
        }
    }
    
}

