//
//  LoginVC.swift
//  TheFacebook
//
//  Created by Rish on 07/09/18.
//  Copyright © 2018 Rish. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // UI Objects
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var handsImageView: UIImageView!
    
    // Constraints
  
    @IBOutlet weak var handsImageView_height: NSLayoutConstraint!
    @IBOutlet weak var coverImageView_height: NSLayoutConstraint!
    @IBOutlet weak var registerButton_bottom: NSLayoutConstraint!
    
    
    var handsImageView_height_cache: CGFloat!
    var coverImageView_height_cache: CGFloat!
    var registerButton_bottom_cache: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handsImageView_height.constant = self.view.frame.height / 2.9
        coverImageView_height.constant = self.view.frame.height / 2.9
        
        if handsImageView_height.constant > 230 && coverImageView_height.constant > 230 {
            handsImageView_height.constant = 230
            coverImageView_height.constant = 230
        }
        handsImageView_height_cache = handsImageView_height.constant
        coverImageView_height_cache = coverImageView_height.constant
        registerButton_bottom_cache = registerButton_bottom.constant
       
    }
    //executed everytime viewAppears
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // declaring notification observer in order to catch UIKeyboardWillShow Notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //switch off notification center
        NotificationCenter.default.removeObserver(self)
    }
    // executed always when white space is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    @objc func keyboardWillShowNotification(notification: Notification) {
        
//        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keyboardRectangle.height
       
        if registerButton_bottom.constant == registerButton_bottom_cache && coverImageView_height.constant == coverImageView_height_cache && handsImageView_height.constant == handsImageView_height_cache {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            registerButton_bottom.constant += keyboardHeight
        }
       
        
        
        print("keyboard will show")
        coverImageView_height.constant -= self.view.frame.width / 5.52
        handsImageView_height.constant -= self.view.frame.width / 5.52

//        coverImageView_height.constant -= self.view.frame.width / 5.52
//        handsImageView_height.constant -= self.view.frame.width / 5.52
        
        UIView.animate(withDuration: 0.5) {
            self.handsImageView.alpha = 0
            self.view.layoutIfNeeded()
           
        }
             }
    }
    
    @objc func keyboardWillHideNotification(notification: Notification) {
        
//        coverImageView_height.constant += self.view.frame.width / 5.52
////        coverImageView_height.constant += self.view.frame.width / 5.52
//        handsImageView_height.constant += self.view.frame.width / 5.52
////        handsImageView_height.constant += self.view.frame.width / 5.52

        coverImageView_height.constant = coverImageView_height_cache
        handsImageView_height.constant = handsImageView_height_cache
        registerButton_bottom.constant = registerButton_bottom_cache

       
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
             if registerButton_bottom.constant == registerButton_bottom.constant - keyboardHeight {
                registerButton_bottom.constant -= keyboardHeight
                print("keyboard will hide")
        }
        }
       

//        registerButton_bottom.constant -= self.view.frame.width / 1.75423
        
        UIView.animate(withDuration: 0.5) {
            self.handsImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        
    }
    
    // Declared after the objects are aligned
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configure_textFieldsView()
        configure_loginBtn()
        configure_orLabel()
        configure_registerButton()
        
    }
    
    
    func configure_textFieldsView() {
        
        let border = CALayer()
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        border.borderColor = color
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: 0, width: textFieldsView.frame.width, height: textFieldsView.frame.height)
        
        let line = CALayer()
        line.borderWidth = width
        line.borderColor = color
        line.frame = CGRect(x: 0, y: textFieldsView.frame.height / 2 - width, width: textFieldsView.frame.width, height: width)
        
        textFieldsView.layer.addSublayer(border)
        textFieldsView.layer.addSublayer(line)
        
        textFieldsView.layer.cornerRadius = 5
        textFieldsView.layer.masksToBounds = true 
    }
    
    func configure_loginBtn() {
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
//        loginButton.isEnabled = false
        
    }
    
    func configure_orLabel() {
        
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        let leftLineLayer = CALayer()
        leftLineLayer.borderWidth = width
        leftLineLayer.borderColor = color
        leftLineLayer.frame = CGRect(x: 0, y: leftLine.frame.height / 2 - width, width: leftLine.frame.width, height: width)
        
        let rightLineLayer = CALayer()
        rightLineLayer.borderWidth = width
        rightLineLayer.borderColor = color
        rightLineLayer.frame = CGRect(x: 0, y: rightLine.frame.height / 2 - width, width: rightLine.frame.width, height: width)
        
        leftLine.layer.addSublayer(leftLineLayer)
        rightLine.layer.addSublayer(rightLineLayer)
        
    }
    
    func configure_registerButton() {
        
        let width = CGFloat(1.25)
        let color = UIColor(displayP3Red: 75/255, green: 102/255, blue: 173/255, alpha: 1).cgColor
        let border = CALayer()
        
        border.borderWidth = width
        border.borderColor = color
        border.frame = CGRect(x: 0, y: 0, width: registerButton.frame.width, height: registerButton.frame.height)
        
        registerButton.layer.addSublayer(border)
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
    }
    
    
    
}
