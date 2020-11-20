//
//  TextFieldNilExtenstion.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/20/20.
//


import Foundation
import UIKit

extension UITextField {

    /// Validates all text field are non-nil and non-empty, Returns true if all fields pass.
    /// - Returns: Bool
    static func validateAll(textFields:[UITextField]) -> Bool {
        // Check each field for nil and not empty.
        for field in textFields {
            // Remove space and new lines while unwrapping.
            guard let fieldText = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return false
            }
            // Are there no other charaters?
            if (fieldText.isEmpty) {
                return false
            }

        }
        // All fields passed.
        return true
    }


    //A function that validates the email address...
    func validateEmail(field: UITextField) -> String? {
        guard let trimmedText = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return nil
        }

        //email addresses are automatically detected as links in i0S...
        guard let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return nil
        }

        let range = NSMakeRange(0, NSString(string: trimmedText).length)
        let allMatches = dataDetector.matches(in: trimmedText,
                                              options: [],
                                              range: range)

        if allMatches.count == 1,
            allMatches.first?.url?.absoluteString.contains("mailto:") == true
        {
            return trimmedText
        }
        return nil
    }

    func validateUserName(field: UITextField) -> String? {

        guard let text:String = field.text else {
            return nil
        }

        /* 3 to 12 characters, no numbers or special characters */
        let RegEx = "^[^\\d!@#£$%^&*<>()/\\\\~\\[\\]\\{\\}\\?\\_\\.\\`\\'\\,\\:\\;|\"+=-]+$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let isValid = Test.evaluate(with: text)

        if (isValid) {
            return text
        }

        return nil
    }

    /*6 to 16 Characters */
    func validatePassword(field: UITextField) -> String?{
        guard let text:String = field.text else {
            return nil
        }
        /*6-16 charaters, and at least one number*/
        let RegEx = "^(?=.*\\d)(.+){6,16}$"
        let Test = NSPredicate(format:"SELF MATCHES%@", RegEx)
        let isValid = Test.evaluate(with: text)

        if (isValid) {
            return text
        }

        return nil

    }
}
