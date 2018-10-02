//
//  RegisterVC.swift
//  TheFacebook
//
//  Created by Rish on 18/09/18.
//  Copyright © 2018 Rish. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var contentView_width: NSLayoutConstraint!
    @IBOutlet weak var emailView_width: NSLayoutConstraint!
    @IBOutlet weak var nameView_width: NSLayoutConstraint!
    @IBOutlet weak var passwordView_width: NSLayoutConstraint!
    @IBOutlet weak var birthdayView_width: NSLayoutConstraint!
    @IBOutlet weak var genderView_width: NSLayoutConstraint!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var emailContinueButton: UIButton!
    @IBOutlet weak var nameContinueButton: UIButton!
    @IBOutlet weak var passwordContinueButton: UIButton!
    @IBOutlet weak var birthdayContinue: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView_width.constant = self.view.frame.width * 5
        emailView_width.constant = self.view.frame.width
        nameView_width.constant = self.view.frame.width
        passwordView_width.constant = self.view.frame.width
        birthdayView_width.constant = self.view.frame.width
        genderView_width.constant = self.view.frame.width
        
        let views : [UIView] = [emailTextField,firstNameTextField,lastNameTextField,passwordTextField,birthdayTextField,emailContinueButton,nameContinueButton,passwordContinueButton,birthdayContinue]

        cornerRadius(for: views)
        
    }
    
    func cornerRadius(for views: [UIView]) {
        views.forEach { (view) in
            view.layer.cornerRadius = 5
            view.layer.masksToBounds = true
        }
        
    }
    
    
    @IBAction func cancelButton_tapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
