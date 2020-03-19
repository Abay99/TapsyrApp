//
//  ProfileModel.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit

struct ProfileModel {
    
    // MARK: - Properties
    private let rowType: ProfileViewController.RowType

    var title: String {
        switch rowType {
        case .fullName:     return ""
        case .phone:     return "Номер телефона"
        case .city:    return "Город"
        case .email:   return "Email"
        }
    }
    
    var description: String {
        switch rowType {
        case .fullName:     return ""
        case .phone:     return "+7 (122) 333 44 55"
        case .city:    return "New York"
        case .email:   return "test1@qwe.com"
        }
    }
    
    var fullName: String {
        switch rowType {
        case .fullName:     return "Testovich Test"
        default: return ""
        }
    }
    
    var image: String {
        switch rowType {
        case .fullName:     return "profileImage"
        default:            return ""
        }
    }
    
    // MARK: - Init
    init(rowType: ProfileViewController.RowType) {
        self.rowType = rowType
    }
}
