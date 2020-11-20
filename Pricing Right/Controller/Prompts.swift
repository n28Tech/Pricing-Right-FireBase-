//
//  Prompts.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/19/20.
//

import Foundation
import UIKit

func prompt(with message: String, in self: UIViewController){
    let alert = UIAlertController(title: "Check Email Field", message:  message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true)
    
    
}
