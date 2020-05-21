//
//  HurtViewController.swift
//  123
//
//  Created by Jack Liu on 2020/3/10.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit
var Hurtttt:Hurt!

class HurtViewController: UIViewController {
    var Hurts=[Hurt]()

    @IBOutlet weak var SliderValue: UILabel!
    @IBOutlet weak var ReviseBtn: UIButton!
    @IBOutlet weak var SaveBtn: UIButton!
    @IBOutlet weak var nowDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Hurts=Hurt.readHurtsFromFile(){
                          self.Hurts=Hurts
                           HurtsArr=Hurts
                           print("*****")
                          print(self.Hurts)
                      }
        ReviseBtn.isEnabled=false
        SliderValue.text="0"
        //Hurtttt.Score=Int(Slideee.value)
       print("-------")
       print(HurtsArr)
       print("-------")
        print("-------")
        print(HurtsArr)
        print("-------")
 
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func ChooseScore(_ sender: UIButton) {
        SliderValue.text=String(sender.tag)
        print(sender.tag)
        print(SliderValue.text!)
    }
    

    @IBAction func SaveScore(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm:ss"
        //print(Hurtttt!.Score)
        let Dstr = formatter.string(from: Date())
        //Hurtttt.time=Dstr
        
        //Hurtttt=Hurt(Score: Int(SliderValue.text!)!, time: Dstr)
        BtnEnable()
        
        HurtsArr.insert(Hurtttt, at: 0)
        Hurt.saveToFile(Hurts: HurtsArr)
        print(HurtsArr)
    }
    var timerr:Timer?
    func BtnEnable(){
        let formatter = DateFormatter()
        formatter.dateFormat = "ss"
        var time=1
        SaveBtn.isEnabled=false
        ReviseBtn.isEnabled=true
          timerr = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            //let nowTime = Date()
            //let time = formatter.string(from: nowTime)
            
            self.nowDate.text = String(time)
            time=time+1
            if time>=11{
                self.SaveBtn.isEnabled=true
                self.ReviseBtn.isEnabled=false
                self.nowDate.text="time's up"
                self.timerr?.invalidate()
            }
            })
    }
  
    @IBAction func Revise(_ sender: Any) {
        print("----Revise----")
        print(HurtsArr)
        print(HurtsArr[0])
        //HurtsArr[0].Score=Int(SliderValue.text!)!
        
        Hurt.saveToFile(Hurts: HurtsArr)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
