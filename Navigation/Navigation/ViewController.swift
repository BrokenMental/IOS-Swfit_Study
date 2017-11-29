//
//  ViewController.swift
//  Navigation
//
//  Created by 407-24 on 2017. 11. 29..
//  Copyright © 2017년 JinukHA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let editViewControl = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewControl.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton" {
            editViewControl.textWayValue = "segue : use Bar button"
        }
        editViewControl.textMessage = txtMessage.text!
        editViewControl.isOn = isOn
        editViewControl.delegate = self
    }

    func  didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
}

