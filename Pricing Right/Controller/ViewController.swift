//
//  ViewController.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/18/20.
//

import UIKit
import Firebase
import ButtonOnKeyboard




class ViewController: UIViewController {
    @IBOutlet weak var totalStackView: UIStackView!
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var informationStackView: UIStackView!
    
    @IBOutlet weak var testView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var showCreateForm: UIButton!
    
    
    
    
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
    
//MARK: - This is the initial load section which hides some section of the form and checks if the user is already signed in.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationStackView.isHidden = true
        button.isHidden = true
        loginButton.threeDStyle()
        showCreateForm.threeDStyle()
    
        if Auth.auth().currentUser != nil {
                performSegue(withIdentifier: cardSegue, sender: self)
            } else {
                 print("no current user")
            }
        
    }
    
   //MARK: - Styling of Login Page hiding login buttons and  reveal fulldataform if use pushes create new account button
    @IBAction func showCreateUserForm(_ sender: UIButton) {
        loginStackView.isHidden = true
        informationStackView.isHidden = false
        button.isHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        button.bk_defaultButtonHeight = buttonHeightConstraint.constant  // Stores the default size of the button.
        button.threeDStyle()
    
    }
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        var visibleHeight: CGFloat = 0
         
        if let userInfo = notification.userInfo {
            if let windowFrame = UIApplication.shared.keyWindow?.frame,
                let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                visibleHeight = windowFrame.intersection(keyboardRect).height
            }
        }
        
        updateButtonLayout(height: visibleHeight)
    }
     
    @objc func keyboardWillHide(_ notification: Notification) {
        updateButtonLayout(height: 0)
    }
    
    func updateButtonLayout(height: CGFloat) {
        button.bk_onKeyboard(scrollView: scrollView, keyboardHeight: height)
    }
    
    
//MARK: - This section is signinging up or sigining in  users depending on what bunch is pressed
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        var reff:DocumentReference? = nil
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
                    reff = db.collection("users").addDocument(data: ["userName": userName, "businessSector": sector, "state":state, "city":city, "busYears":busYears, "expYears":expYears, "gender":gend, "ethnicity":ethnic!,"uid":userId], completion: { (err) in
                        if let err = err{
                            print("Error adding document: \(err)")
                        }else{
                            print("Document added with ID: \(reff!.documentID)")

                        }
                    })
                    
                }
    
            }else{
                prompt(with: "A Form Field is empty", in: self)
            }
        performSegue(withIdentifier: cardSegue, sender: self)
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
        
        performSegue(withIdentifier: cardSegue, sender: self)
    }

}
//MARK: - Button Extention to style all buttons on  this view
extension UIButton{
    
    func threeDStyle(){
        let button = self
        button.layer.cornerRadius = 6.0;
        button.layer.borderWidth = 0.5;
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
    }
    
    
}

