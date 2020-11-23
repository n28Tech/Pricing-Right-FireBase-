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
    
        if Auth.auth().currentUser != nil {
                performSegue(withIdentifier: clientSegue, sender: self)
            } else {
                 print("no current user")
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
        if (UITextField.validateAll(textFields: [emailEnterTextField, passwordEnterTextField])) {
                
                let email = emailEnterTextField.text
                let password = passwordEnterTextField.text
    
        
        
                Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
                      guard let strongSelf = self else { return }
            
                }
        }else{
            prompt(with: "A email or password Field is empty", in: self)
        }
        
        performSegue(withIdentifier: clientSegue, sender: self)
    }

}


