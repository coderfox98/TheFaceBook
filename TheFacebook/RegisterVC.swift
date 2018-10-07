//
//  RegisterVC.swift
//  TheFacebook
//
//  Created by Rish on 18/09/18.
//  Copyright © 2018 Rish. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
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
    
    @IBOutlet weak var footerView: UIView!
    
    var datePicker : UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureFooterView()
        
        contentView_width.constant = self.view.frame.width * 5
        emailView_width.constant = self.view.frame.width
        nameView_width.constant = self.view.frame.width
        passwordView_width.constant = self.view.frame.width
        birthdayView_width.constant = self.view.frame.width
        genderView_width.constant = self.view.frame.width
        
        let views : [UIView] = [emailTextField,firstNameTextField,lastNameTextField,passwordTextField,birthdayTextField,emailContinueButton,nameContinueButton,passwordContinueButton,birthdayContinue]
        
        let textFields : [UITextField] = [emailTextField,firstNameTextField,lastNameTextField,passwordTextField,birthdayTextField]

        cornerRadius(for: views)
        
        addPadding(for: textFields)
        
        // creating date picker and implementing into textField
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -5, to: Date())
        datePicker.addTarget(self, action: #selector(self.datePickerDidChange(_:)), for: .valueChanged)
        birthdayTextField.inputView = datePicker
    }
    
    func addPadding(for textFields: [UITextField]) {
        textFields.forEach { (textField) in
            let blankView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
            textField.leftView = blankView
            textField.leftViewMode = .always
        }
        
    }
    
    func configureFooterView() {
        let topLine = CALayer()
        topLine.borderWidth = 1
        topLine.borderColor = UIColor.lightGray.cgColor
        topLine.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1)
        footerView.layer.addSublayer(topLine)
    }
    
    func cornerRadius(for views: [UIView]) {
        views.forEach { (view) in
            view.layer.cornerRadius = 5
            view.layer.masksToBounds = true
        }
    }
    // called everytime when textField is changed
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        
        let helper = Helper()
        
        if textField == emailTextField {
            if helper.isValid(email: emailTextField.text!) {
            print("VALID")
            emailContinueButton.isHidden = false
            }
        }else if textField == firstNameTextField || textField == lastNameTextField{
            if helper.isValid(name: firstNameTextField.text!) && helper.isValid(name: lastNameTextField.text!) {
                print("valid name")
                nameContinueButton.isHidden = false
            }
        }
            else if textField == passwordTextField {
                
                if passwordTextField.text!.count >= 6 {
                    print("Valid password")
                    passwordContinueButton.isHidden = false
                }
            }
        
    }
    
    
    // called once continue button is pressed
    @IBAction func emailContinueButton_Tapped(_ sender: Any) {
        // Move to next page
        let position = CGPoint(x: self.view.frame.width, y: 0)
       scrollView.setContentOffset(position, animated: true)
        
        // show keyboard of next TextField
        if firstNameTextField.text!.isEmpty {
            firstNameTextField.becomeFirstResponder()
        }else if lastNameTextField.text!.isEmpty {
            lastNameTextField.becomeFirstResponder()
        }else if firstNameTextField.text!.isEmpty == false && lastNameTextField.text!.isEmpty == false {
            firstNameTextField.resignFirstResponder()
            lastNameTextField.resignFirstResponder()
        }
        
    }
    @IBAction func fullNameContinueButtton_tapped(_ sender: Any) {
        let position = CGPoint(x: self.view.frame.width * 2, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        if passwordTextField.text!.isEmpty {
            passwordTextField.becomeFirstResponder()
        }else if passwordTextField.text!.isEmpty == false {
            passwordTextField.resignFirstResponder()
        }
        
    }
    @IBAction func passwordContinueButton_Tapped(_ sender: Any) {
        let position = CGPoint(x: self.view.frame.width * 3, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        if birthdayTextField.text!.isEmpty {
            birthdayTextField.becomeFirstResponder()
        }else if birthdayTextField.text!.isEmpty == false {
            birthdayTextField.resignFirstResponder()
        }
    }
    
    // func will get executed whenever date is selected
    @objc func datePickerDidChange(_ datePicker: UIDatePicker) {
        // declaring the format to be used in textField while presenting the date
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        birthdayTextField.text = formatter.string(from: datePicker.date)
        
        // declaring the format of date, then to place a dummy date into this format
        let compareDateFormatter = DateFormatter()
        compareDateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let compareDate = compareDateFormatter.date(from: "2013/01/01 00:01")
        
        // IF logic. If user is older than 5 years, show Continue Button
        if datePicker.date < compareDate! {
            birthdayContinue.isHidden = false
        } else {
            birthdayContinue.isHidden = true
        }
    }
    
    @IBAction func birthdayContinueButton_Tapped(_ sender: Any) {let position = CGPoint(x: self.view.frame.width * 4, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        birthdayTextField.resignFirstResponder()
    }
    
    @IBAction func cancelButton_tapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
