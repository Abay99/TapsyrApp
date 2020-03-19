//
//  TextFieldOption.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit

enum TextFieldOption: Int, CustomStringConvertible {
    case emailTextField
    case passwordTextField
    
    var description: String {
        switch self {
        case .emailTextField: return "Введите почту"
        case .passwordTextField: return "Введите пароль"
        }
    }
    
    var keyboard: UIKeyboardType {
        switch self {
        case .emailTextField:
            return .emailAddress
        case .passwordTextField:
            return .default
        }
    }
}
