//
//  ViewController.swift
//  DatePicker
//
//  Created by 407-24 on 2017. 9. 20..
//  Copyright © 2017년 Jinuk Ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let timeSelect: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    //var count = 0
    var flag = false

    var alarmTime: String?
    var currentTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelect, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간 : "+formatter.string(from: datePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        flag = false
    }
    
    func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1;
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : "+formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        currentTime = formatter.string(from: date as Date)
        
        if(currentTime == alarmTime && flag == false){
            let AlertNotice = UIAlertController(title: "알람", message: "설정된 시간입니다!", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertActionStyle.default, handler:nil)
            AlertNotice.addAction(onAction)
            present(AlertNotice, animated: true, completion: nil)
            flag = true
        }
    }
}

