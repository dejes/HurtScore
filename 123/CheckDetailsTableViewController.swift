//
//  CheckDetailsTableViewController.swift
//  123
//
//  Created by Jack Liu on 2020/4/7.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class CheckDetailsTableViewController: UITableViewController {
    var GetHurtsFromPrevious:Hurt?=Hurt()
    @IBOutlet weak var barItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="編號"+(GetHurtsFromPrevious?.PtNum!)!
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
        return (GetHurtsFromPrevious?.ScoreAndTime.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckDetails", for: indexPath) as! CheckDetailsTableViewCell
        let TempObj=GetHurtsFromPrevious?.ScoreAndTime[indexPath.row]
        if let TempInt=TempObj?.Score{
            if TempInt >= 0{
                 cell.HScore.text="痛度："+String(TempInt)
            }else{
                 cell.HScore.text="痛度：未記錄"
            }
            
           
        }
        cell.HTime.text=TempObj?.time
        // Configure the cell...

        return cell
    }
    @IBAction func CreatetxtFile(_ sender: Any) {
        let filename = "no-"+(GetHurtsFromPrevious?.PtNum!)!
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(filename).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        var writeString = "編號：" + GetHurtsFromPrevious!.PtNum! + "\n\n"
       
        for data in GetHurtsFromPrevious!.ScoreAndTime{
            if let scoree = data?.Score , let timee = data?.time {
                if(scoree>=0){
                    writeString = writeString + "痛度：" + String(scoree) + "\t" + timee + "\n"
                }else{
                    writeString = writeString + "痛度：未記錄" + "\t" + timee + "\n"
                }
                
                 
            }
        }
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        var readString = "" // Used to store the file contents
      //  var txtfile
        do {
            // Read the file contents
            do {
                let contents = try FileManager.default.contentsOfDirectory(at: DocumentDirURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                for indexx in 0..<contents.count {
                    print(contents[indexx].lastPathComponent)
                    if contents[indexx].lastPathComponent == filename + ".txt" {
                        print("123")
                        let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                           if UIDevice.current.userInterfaceIdiom == .pad {
                               activityViewController.popoverPresentationController?.barButtonItem = barItem
                           }
                           present(activityViewController, animated: true, completion: nil)
                    }
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            //let contents = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        print("File Text: \(readString)")
       
      /* if let data = try? Data(contentsOf: fileURL){
            let activityViewController = UIActivityViewController(activityItems: [readString], applicationActivities: nil)
            if UIDevice.current.userInterfaceIdiom == .pad {
                activityViewController.popoverPresentationController?.barButtonItem = barItem
            }
            present(activityViewController, animated: true, completion: nil)
        }
        else {
            print("error")
        }*/
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
