//
//  NewHurtViewController.swift
//  123
//
//  Created by Jack Liu on 2020/3/31.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit
import AVFoundation

class NewHurtViewController: UIViewController {
    var Nanba:String?
    var Jikan:String?
 //   var LastingSec:Int!
    var Hurttttt:Hurt?
    var ExitJudge:Int=0
    var DetailObj:Details?=Details()
    var DetailList=[Details?]()
    var timerr:Timer?
    var datestr:String?
    
    let avplayer = AVPlayer()
    let systemSoundID: SystemSoundID = 1016
    
    @IBOutlet var scorebtn: [UIButton]!
    
    @IBOutlet weak var NokoriJikan: UILabel!
    @IBOutlet weak var DescText: UILabel!
    @IBOutlet weak var crying: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton=true
        //print(Nanba)
        if let str=Nanba /*, let str2=Jikan*/ {
            NokoriJikan.text="編號："+str
           // DescText.text="每"+str2+"秒會記錄一次。"
        }
        
        //print(LastingSec!)
        //print(Hurttttt)
        /*if let ppp=Ptnumm{
            Hurttttt.PtNum?=ppp
        }*/
        
       
         TimerStart()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ScoreBtn(_ sender: UIButton) {
        DescText.textColor=UIColor.white
        let date: Date = Date()
        let formatter = DateFormatter()
        //var testing:Details?=Details()
        formatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
        //print(sender.tag)
        print(formatter.string(from:date))
        //testing?.Score=sender.tag
        //if let ST=sender.tag{
            DetailObj?.Score=sender.tag
            DetailObj?.time=datestr
        //	}
        //crying.text=String(sender.tag)
        print(DetailObj)
        for i in 0...9 {
            scorebtn[i].backgroundColor=UIColor.white
            scorebtn[i].tintColor=UIColor.systemBlue
        }
        sender.backgroundColor=UIColor.systemBlue
        sender.tintColor=UIColor.white
        
        //let Dstr = formatter.string(from: Date())
    }
    
    @IBAction func ExitFunc(_ sender: Any) {
        var Stanley:Hurt?=Hurt()
        ExitJudge=ExitJudge+1
        print(ExitJudge)
        if ExitJudge>=4{
            
            DetailList.insert(DetailObj, at: 0)
            if DetailList[0]?.Score != -1 {
                print(DetailList[0])
                if DetailList[0]?.time==DetailList[1]?.time{
                    DetailList.remove(at: 0)
                }
            }
            
            if let str=Nanba{
                Stanley?.PtNum=str
            }
            
            //if let str=Nanba{
            Stanley?.ScoreAndTime=DetailList
            //Hurttttt.PtNum=str
              // Hurttttt?.ScoreAndTime=DetailList
            HurtsArr.insert(Stanley!, at: 0)
            Hurt.saveToFile(Hurts: HurtsArr)
            //}
           
            self.navigationController?.popToRootViewController(animated: true)
            self.timerr?.invalidate()
            print(HurtsArr)
        }

    }
   
    
    
    var count=0
    func TimerStart(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "ss"
        
        
        var time=0
        
        if let Temp=Jikan{
            if let LastingSec=Int(Temp){
               timerr=Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                   self.crying.text=String(LastingSec-time)
                   time=time+1
                   if time>=LastingSec{
                        if time == LastingSec{
                            self.DescText.text="請按下按鈕"
                            AudioServicesPlaySystemSound(self.systemSoundID)
                        }
                        
                        self.DescText.textColor=UIColor.systemRed
                        let date: Date = Date()
                        let dateformatter = DateFormatter()
                        dateformatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
                        self.datestr=dateformatter.string(from: date)
                        
                        //self.timerr?.invalidate()
                        if self.count>0{
                            //if self.DetailObj?.Score == -1 {
                                self.DetailObj?.time=self.datestr
                            //}
                            self.DetailList.insert(self.DetailObj, at: 0)
                            print(self.DetailList)
                            print(time)
                            self.DetailObj?.Score = -1
                        }
                        time=0
                        self.count+=1
                   }
                })
            }
           
        }
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
