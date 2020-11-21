//
//  ViewController.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/18/20.
//

import UIKit
import Firebase




class ViewController: UIViewController {
    
    @IBOutlet weak var emailEnterTextField: UITextField!
    
    @IBOutlet weak var passwordEnterTextField: UITextField!
    
    @IBOutlet weak var businessSector: UITextField!
    
    @IBOutlet weak var businessState: UITextField!
    
    @IBOutlet weak var businessCity: UITextField!
    
    @IBOutlet weak var businessYears: UITextField!
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var experience: UITextField!
    
    
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var ethnicity: UITextField!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // ref = Database.database().reference()
        
                if Auth.auth().currentUser != nil {
                    performSegue(withIdentifier: clientSegue, sender: self)
                } else {
                  print("nouser")
        
        
                }
        
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
         
        
        if (UITextField.validateAll(textFields: [emailEnterTextField, passwordEnterTextField,userNameText,businessSector,businessState,businessYears,experience,gender,ethnicity])) {
        let email = emailEnterTextField.text!
        let password = passwordEnterTextField.text!
        let userName = userNameText.text!
        let sector = businessSector.text!
        let state = businessState.text!
        let city = businessCity.text!
        let busYears = businessYears.text!
        let expYears = experience.text!
        let gend = gender.text!
        let ethnic = ethnicity.text
        

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            let userId = (Auth.auth().currentUser?.uid)!
            ref.child("Users").child(userId).setValue(["userName": userName, "businessSector": sector, "state":state, "city":city, "busYears":busYears, "expYears":expYears, "gender":gend, "ethnicity":ethnic])
        }
    
        }else{
            prompt(with: "A Form Field is empty", in: self)
        

        }
    
        performSegue(withIdentifier: clientSegue, sender: self)
    
    }
    
    @IBAction func checkcurrentuser(_ sender: Any) {
        

//        if Auth.auth().currentUser != nil {
//            let user = (Auth.auth().currentUser?.uid)!
//            ref.child("Company").child(user).setValue(["companyName:" :"testCompany"])
//        } else {
//          print("nouser")
//
//
//        }
        performSegue(withIdentifier: clientSegue, sender: self)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! ClientTableViewController
//        let userId = (Auth.auth().currentUser?.uid)!
//           // destinationVC.userId = userId
//
//
//
//
//    }
    

}


