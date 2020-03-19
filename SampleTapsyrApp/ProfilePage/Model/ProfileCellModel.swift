//
//  ProfileModel.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit

struct ProfileCellModel {
    
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
    
    // MARK: - Init
    init(rowType: ProfileViewController.RowType) {
        self.rowType = rowType
    }
}
