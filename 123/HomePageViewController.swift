//
//  HomePageViewController.swift
//  123
//
//  Created by Jack Liu on 2020/4/7.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    var CallingHurts=[Hurt]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("owow")
        if let CallingHurts=Hurt.readHurtsFromFile(){
            self.CallingHurts=CallingHurts
            HurtsArr=CallingHurts
            print(HurtsArr)
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
