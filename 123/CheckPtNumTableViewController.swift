//
//  CheckPtNumTableViewController.swift
//  123
//
//  Created by Jack Liu on 2020/4/7.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class CheckPtNumTableViewController: UITableViewController {
    var CallingHurts=[Hurt]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let CallingHurts=Hurt.readHurtsFromFile(){
            self.CallingHurts=CallingHurts
            HurtsArr=CallingHurts
            print(HurtsArr)
            print(CallingHurts)
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CallingHurts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PtNumCell", for: indexPath) as! CheckPtNumTableViewCell
        let Hurtsss=CallingHurts[indexPath.row]
        cell.NumText.text="編號：" + Hurtsss.PtNum!
        
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

    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            CallingHurts.remove(at: indexPath.row)
            Hurt.saveToFile(Hurts:CallingHurts)
            //self.loadData()
            self.tableView.beginUpdates()
            DispatchQueue.main.async {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
            }
            print(indexPath.row)
            //print(CallingHurts[indexPath.row])
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    func loadData() {
        // code to load data from network, and refresh the interface
        tableView.reloadData()
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destinationController = segue.destination as? CheckDetailsTableViewController, let row=tableView.indexPathForSelectedRow?.row{
            destinationController.GetHurtsFromPrevious=CallingHurts[row]
            
        }
        
        
    }
    

}
