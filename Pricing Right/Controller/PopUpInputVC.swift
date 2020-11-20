//
//  ViewController1.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/16/20.
//

import Foundation
import UIKit
import STPopup

class PopUpInPutVC: UIViewController{
    
    override func viewDidLoad() {
        let clientName = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        //UITextField.center = CGPoint(x: 160, y: 284)
        //clientName.textAlignment = NSTextAlignment.center
        clientName.placeholder = "Client Name"
          self.view.addSubview(clientName)
        
        let clientCity = UITextField(frame: CGRect(x: 0, y: 22, width: 200, height: 21))
        //UITextField.center = CGPoint(x: 160, y: 284)
        //clientCity.textAlignment = NSTextAlignment.center
        clientCity.placeholder = "Client City"
          self.view.addSubview(clientCity)
        
        let clientState = UITextField(frame: CGRect(x: 0, y: 43, width: 200, height: 21))
        //UITextField.center = CGPoint(x: 160, y: 284)
        //clientState.textAlignment = NSTextAlignment.center
        clientState.placeholder = "Client State"
          self.view.addSubview(clientState)
        
        let clientSize = UITextField(frame: CGRect(x: 0, y: 64, width: 200, height: 21))
        //UITextField.center = CGPoint(x: 160, y: 284)
        //clientSize.textAlignment = NSTextAlignment.center
        clientSize.placeholder = "Client Size"
          self.view.addSubview(clientSize)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Input New Client"
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.printSomething(sender:)) )
        
        
        // It's required to set content size of popup.
        contentSizeInPopup = CGSize(width: 300, height: 400)
        landscapeContentSizeInPopup = CGSize(width: 400, height: 200)
        

    
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    @objc func printSomething(sender: UIBarButtonItem){
       // self.navigationController?.popViewController(animated: true)
       
        
        
        print("soimething")
        popupController?.dismiss()
    
    }
}
