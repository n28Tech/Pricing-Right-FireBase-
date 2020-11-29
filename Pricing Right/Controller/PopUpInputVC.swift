//
//  ViewController1.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/16/20.
//

import Foundation
import UIKit
import STPopup
import Firebase

class PopUpInPutVC: UIViewController{
    
    
    let screenSize = UIScreen.main.bounds
    let clientName = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let clientCity = UITextField(frame: CGRect(x: 0, y: 22, width: 200, height: 21))
    let clientState = UITextField(frame: CGRect(x: 0, y: 43, width: 200, height: 21))
    let clientSize = UITextField(frame: CGRect(x: 0, y: 64, width: 200, height: 21))
    
//MARK: - Set up for the Pop including putting on the fields on the pop and blanking them out hwen the pop loads ane/orc appears anew
    override func viewDidLoad() {
        
        clientName.placeholder = "Client Name"
          self.view.addSubview(clientName)
        
        clientCity.placeholder = "Client City"
          self.view.addSubview(clientCity)

        clientState.placeholder = "Client State"
          self.view.addSubview(clientState)

        clientSize.placeholder = "Client Size"
          self.view.addSubview(clientSize)
        
        clientName.text = ""
        clientSize.text = ""
        clientCity.text = ""
        clientState.text = ""
    }
    override func viewDidAppear(_ animated: Bool) {
        clientName.text = ""
        clientSize.text = ""
        clientCity.text = ""
        clientState.text = ""
    }
//MARK: - setting the frame configuration for the pop-up
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Input New Client"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveClient(sender:)) )
        
    
        contentSizeInPopup = CGSize(width: screenSize.width / 1.2, height: screenSize.height/2)
        landscapeContentSizeInPopup = CGSize(width: 400, height: 200)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//MARK: - Save Function
    
    @objc func saveClient(sender: UIBarButtonItem){
        var reff: DocumentReference? = nil
        
        if (UITextField.validateAll(textFields: [clientName, clientCity,clientState,clientSize])) {
            let user = (Auth.auth().currentUser?.uid)!
            reff = db.collection("projects").addDocument(data: ["clientName:" : clientName.text!, "clientCity": clientCity.text!, "clientState":clientState.text!, "clientSize": Float(clientSize.text!)!,"uid":user,"lastUpdated": FieldValue.serverTimestamp()]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //should add pop let the now its saved???
                }
            }
            
            
            
            //
            
            
            popupController?.dismiss()
        
        }else{
            prompt(with: "A Form Field is empty", in: self)
            
        }
       

    }
}
