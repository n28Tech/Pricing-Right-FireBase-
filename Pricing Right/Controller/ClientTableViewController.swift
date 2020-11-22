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
   

    override func viewDidLoad() {
        super.viewDidLoad()
        returnFunction()
    
    }
    
   func returnFunction() -> () {
   
    getChartIndexValues() { (clients) -> () in
        
        //Your code to process the results belongs here
        self.clientsForTable = clients["Clients"] as! NSDictionary
        self.tableView.reloadData()
      }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clientsForTable.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let keys = clientsForTable.allKeys
        let clientDic = clientsForTable[keys[indexPath.row]] as? NSDictionary
        
        let cell = Bundle.main.loadNibNamed("ClientsTableViewCell", owner: self, options: nil)?.first as! ClientsTableViewCell
          cell.cityLabel.text = clientDic!["clientCity"] as? String
          cell.sectorLabel.text = clientDic!["clientName:"] as? String
          cell.clientSizelabel.text = clientDic!["clientSize"] as? String
         cell.stateLabel.text = clientDic!["clientState"] as? String
        return cell
    }
    
    
    @IBAction func addClients(_ sender: UIBarButtonItem) {
        
        let popupController = STPopupController(rootViewController: popViewController)
        popupController.style = .bottomSheet
        popupController.present(in: self)
    }

}
