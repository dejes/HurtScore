//
//  InputDataViewController.swift
//  123
//
//  Created by Jack Liu on 2020/3/30.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit


class InputDataViewController: UIViewController, UITextFieldDelegate{
    

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!

    @IBOutlet weak var NextPageBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tf2.keyboardType = .asciiCapableNumberPad
        
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func QAQ(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
          return true
       } else {
        if string.isEmpty {
           return true
        }
          return false
       }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationController = segue.destination as? NewHurtViewController
        destinationController?.Nanba=tf1.text
        destinationController?.Jikan=tf2.text
        /*sec=tf2.text
        Numb=tf1.text
        
        destinationController?.Ptnumm=Numb
        destinationController?.LastingSec=Int(sec)*/
    }
    

}
