//
//  ClientTableViewControllerwithCard.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/23/20.
//

import UIKit
import STPopup
import Firebase

class ClientTableViewControllerwithCard: UITableViewController {
     let popViewController = PopUpInPutVC()
    var clientsForTable = NSDictionary()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnFunction()
        
                
       
        tableView.separatorColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardTableViewCell
        
        cell.contentView.backgroundColor = UIColor(white:0.95, alpha: 1)
          
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
