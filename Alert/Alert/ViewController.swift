//
//  ViewController.swift
//  Alert
//
//  Created by 407-24 on 2017. 10. 11..
//  Copyright © 2017년 Jinuk HA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lampImg: UIImageView!
    
    let imgOn : UIImage = UIImage(named: "lamp_on.png")!
    let imgOff : UIImage = UIImage(named: "lamp_off.png")!
    let imgRemove : UIImage = UIImage(named: "lamp_remove.png")!
    
    var isLampOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lampImg.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler:nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            let lampOnAlert = UIAlertController(title: "램프켜기", message: "램프를 켜시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
            
            let onAction = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOn
                self.isLampOn=true
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            lampOnAlert.addAction(cancelAction)
            
            present(lampOnAlert, animated: true, completion: nil)
//            lampImg.image = imgOn
//            isLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(!isLampOn){
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off 상태입니다.", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler:nil)
            lampOffAlert.addAction(onAction)
            present(lampOffAlert, animated: true, completion: nil)
        }else{
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
            let offAction = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.default, handler: nil)
        
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
        
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOn
            self.isLampOn=true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertActionStyle.destructive, handler: {ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn=false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

