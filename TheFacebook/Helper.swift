//
//  Helper.swift
//  TheFacebook
//
//  Created by Rish on 07/10/18.
//  Copyright © 2018 Rish. All rights reserved.
//

import UIKit

class Helper {
    
    // Validate email address function /logic
    func isValid(email: String) -> Bool {
        // declaring the regular expression (chars to be used). Applying the rule to current state. Verifying the result 
        let regex = "[A-z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: email)
        
        return result
    }
    
    // Validate name function / logic
    func isValid(name: String) -> Bool {
        let regex = "[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: name)
        
        return result
    }
    
    // show alert message to the user
    func showAlert(title: String,message: String, from: UIViewController) {
        
        // creating alertcontroller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        from.present(alert, animated: true, completion: nil)
    }
}
