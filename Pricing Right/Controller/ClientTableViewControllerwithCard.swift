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
    var clientsForTable = [NSDictionary]()
    var singleProject = NSDictionary()
  
//MARK: - This section is Loading all the elements that need to be load with the view, including calling the fuinction to retrieve the data
    override func viewDidLoad() {
        super.viewDidLoad()
        returnFunction()
        
       
tableView.separatorColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    
    }
    
 //MARK: - this section retries data from the FirebaseCloud database
   func returnFunction() -> () {
   
    getChartIndexValues() { (clients) -> () in

        
        self.clientsForTable = clients
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
       
        
        let clientDic = clientsForTable[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardTableViewCell
        
            cell.contentView.backgroundColor = UIColor(white:0.95, alpha: 1)
        
            cell.cityLabel.text = clientDic["clientCity"] as? String
            cell.sectorLabel.text = clientDic["clientName:"] as? String
        cell.clientSizelabel.text = "\(String(describing: clientDic["clientSize"]!))".currencyFormatting()
            cell.stateLabel.text = clientDic["clientState"] as? String
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
        singleProject = clientsForTable[indexPath.row]
        
      performSegue(withIdentifier:"outcomes", sender: self)
        
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! OutcomesTableViewController
        destVC.projectData = singleProject as! [String : Any]
        
            
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cartFooter = Bundle.main.loadNibNamed("footerTableViewCell", owner: self, options: nil)?.first as! footerTableViewCell
       
        var sum = 0
        for clientSive in clientsForTable{
            sum += Int(clientSive["clientSize"] as! Float)

        }
        let sumTest = "\(sum)"
        cartFooter.totalRevLabel.text = sumTest.currencyFormatting()
        return cartFooter
    }
    
    
    
 //MARK: - This section is the button ton add new projects to the database
    @IBAction func addClients(_ sender: UIBarButtonItem) {
        
        let popupController = STPopupController(rootViewController: popViewController)
        popupController.style = .bottomSheet
        popupController.present(in: self)
    }

}


