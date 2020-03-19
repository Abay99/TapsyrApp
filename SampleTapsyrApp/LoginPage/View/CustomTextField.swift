//
//  CustomTextField.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit

class CustomTextField: UITextField {

    let padding: CGFloat
    let height: CGFloat
    
    init(padding: CGFloat = 20, height: CGFloat = 36, option: TextFieldOption) {
        self.padding = padding
        self.height = height
        super.init(frame: .zero)
        keyboardType = option.keyboard
        layer.cornerRadius = 10
        textAlignment = .left
        backgroundColor = .white
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.borderWidth = 0.5
        textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        font = UIFont.systemFont(ofSize: 16.0)
        placeholder = option.description
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
