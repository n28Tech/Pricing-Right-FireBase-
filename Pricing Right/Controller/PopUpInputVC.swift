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
    let clientName = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let clientCity = UITextField(frame: CGRect(x: 0, y: 22, width: 200, height: 21))
    let clientState = UITextField(frame: CGRect(x: 0, y: 43, width: 200, height: 21))
    let clientSize = UITextField(frame: CGRect(x: 0, y: 64, width: 200, height: 21))
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
        clientName.text = ""
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Input New Client"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveClient(sender:)) )
        // It's required to set content size of popup.
        contentSizeInPopup = CGSize(width: 300, height: 400)
        landscapeContentSizeInPopup = CGSize(width: 400, height: 200)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    @objc func saveClient(sender: UIBarButtonItem){
       // self.navigationController?.popViewController(animated: true)
        let user = (Auth.auth().currentUser?.uid)!
        let userRef = ref.child("Users").child(user)
        let clientRef = userRef.child("Clients")
        let movieRefAvengers = clientRef.child(clientName.text!)
        let dictMovieRefAvengers: [String: String] = ["clientName:" : clientName.text!, "clientCity": clientCity.text!, "clientState":clientState.text!, "clientSize": clientSize.text!]
        movieRefAvengers.setValue(dictMovieRefAvengers)
        
        
        
        
//        let user = (Auth.auth().currentUser?.uid)!
//        let client =
//        ref.child("Client").child(user).setValue(client)
      // let locationRef = ref.childByAutoId()
        //locationRef.setValue(client)
        
        popupController?.dismiss()
    
    }
}
