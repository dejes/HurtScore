//
//  HurtChooseTableViewController.swift
//  123
//
//  Created by Jack Liu on 2020/3/10.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class HurtChooseTableViewController: UITableViewController {
    var Hurts=[Hurt]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Hurts=Hurt.readHurtsFromFile(){
                   self.Hurts=Hurts
                    HurtsArr=Hurts
                    print("*****")
                   print(self.Hurts)
               }
       
      // HurtsArr.insert(Hurts, at: 0)
        print("-------")
        print(HurtsArr)
        print("-------")
        
        //self.loadData();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadData() {
        // code to load data from network, and refresh the interface
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Hurts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HurtIdentifier", for: indexPath) as! HurtChooseTableViewCell
        let Hurtsss=Hurts[indexPath.row]
        cell.HurtScore.text=String(Hurtsss.Score)
        cell.Date.text=Hurtsss.time
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
  /*  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
*/

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
