//
//  ClientTableViewController.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/19/20.
//

import UIKit
import STPopup
import Firebase

class ClientTableViewController: UITableViewController {
    
   
    let popViewController = PopUpInPutVC()
    var clientsForTable = NSDictionary()
    var test: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        returnFunction()
        
    
        
        
        //clients = loader.loadClient()
        
        //print(clients)
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
   func returnFunction() -> () {
   
    getChartIndexValues() { (clients) -> () in
        
        //Your code to process the results belongs here
        self.clientsForTable = clients["Clients"] as! NSDictionary
        print("Your result is \(self.clientsForTable ) and count \(self.clientsForTable.count)")
        self.tableView.reloadData()
      }
    
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappear\(test)")
        
        //returnFunction()
        
        //tableView.reloadData()
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        print(clientsForTable.count)
        return clientsForTable.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cell = Bundle.main.loadNibNamed("ClientsTableViewCell", owner: self, options: nil)?.first as! ClientsTableViewCell
        let keys = clientsForTable.allKeys
        //print(keys)
        let clientDic = clientsForTable[keys[indexPath.row]] as? NSDictionary
            cell.cityLabel.text = clientDic!["clientCity"] as? String
           cell.sectorLabel.text = clientDic!["clientName:"] as? String
            cell.clientSizelabel.text = clientDic!["clientSize"] as? String
            cell.stateLabel.text = clientDic!["clientState"] as? String
        
        
        
        
       
        // Configure the cell...

        

        return cell
        
    
    }
    
    
    @IBAction func addClients(_ sender: UIBarButtonItem) {
        
        
        let popupController = STPopupController(rootViewController: popViewController)
        popupController.style = .bottomSheet
        popupController.present(in: self)
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
