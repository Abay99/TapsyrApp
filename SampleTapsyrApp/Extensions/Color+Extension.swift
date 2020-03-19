//
//  Color+Extension.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit

extension UIColor {
    @objc convenience init(hexString: String) {
        let scanner = Scanner(string: hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
