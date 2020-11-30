//
//  Global variables.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/19/20.
//

import Foundation
import Firebase


let db = Firestore.firestore()

var clientSegue = "clientSegue"

var cardSegue = "cardSegue"

var footer = "footer"

var outcomes = "outcomes"


//MARK: - Extensions(Strings)
extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}








