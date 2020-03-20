//
//  TextFieldValidator.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit
import SwiftValidator

extension LoginViewController {
    func setupValidator() {
        validator.registerField(emailTextField, rules: [EmailRule(), MinLengthRule(length: 1), MaxLengthRule(length: 40)])
        validator.registerField(passwordTextField, rules: [RequiredRule(), MinLengthRule(length: 1), MaxLengthRule(length: 40)])
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("Successfully changed password in Profile")
            if let textfield = validationRule.field as? UITextField {
                textfield.layer.borderWidth = 0.5
                textfield.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            
        }, error: { (validationError) -> Void in
            print("Error happened in changing password in Profile")
            if let textfield = validationError.field as? UITextField {
                textfield.layer.borderWidth = 1.0
                textfield.layer.borderColor = UIColor.red.cgColor
            }
        })
    }
}

extension LoginViewController: ValidationDelegate {
    func validationSuccessful() {
        if checkFormValidity() {
            let viewController = ProfileViewController()
            if let emailData = emailTextField.text, let passwordData = passwordTextField.text {
                let token = "ztTGT8dSCJiXvYBbT90AzckaSmHFRAAW"
                let parameters = ["email": emailData, "password": passwordData]
                Request.shared.postUserAuthentication(token: token, params: parameters, completionHandler: { (profileData) in
                    
                    viewController.configureItems(model: profileData)
                    self.present(viewController, animated: true, completion: nil)
                    
                }, completionHandlerError: { (error) in
                    self.showAlert(title: "Error", msg: error)
                })
            }
        }
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("Validation Failed")
    }
}
