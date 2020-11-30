//
//  OutcomesTableViewController.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/29/20.
//

import UIKit

class OutcomesTableViewController: UITableViewController {

    var projectData = [String: Any]()
    var locationsForTable = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      let state = projectData["clientState"] as? String
        returnFunction(state: state!)
        
    }
    
    func returnFunction(state: String) -> () {
    
        getbyLocationData(location: state) { (clients) -> () in

         
         self.locationsForTable = clients
         self.tableView.reloadData()
       }
     
     }
    
   

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locationsForTable.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let clientDic = locationsForTable[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cell")
        cell.textLabel!.text = clientDic["clientCity"]! as? String
        cell.detailTextLabel!.text = "\(String(describing: clientDic["clientSize"]!))".currencyFormatting()
       

        return cell
    }
    

   

}
