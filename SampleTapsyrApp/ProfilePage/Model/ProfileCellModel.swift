//
//  ProfileCellModel.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit

struct ProfileCellModel {
    
    // MARK: - Properties
    private let rowType: ProfileViewController.RowType
    private let resultData: ProfileData?

    var title: String {
        switch rowType {
        case .fullName:     return ""
        case .phone:     return "Номер телефона"
        case .city:    return "Город"
        case .email:   return "Email"
        }
    }
    
    var description: String {
        guard let phone = resultData?.data?.phone, let city = resultData?.data?.city, let email = resultData?.data?.email else { return "" }
        
        switch rowType {
        case .fullName:     return ""
        case .phone:     return phone
        case .city:    return city
        case .email:   return email
        }
    }
    
    var fullName: String {
        guard let name = resultData?.data?.name else { return "" }
        
        switch rowType {
        case .fullName:   return name
        default: return ""
        }
    }
    
    var image: String {
        guard let image = resultData?.data?.avatar else { return "" }
        
        switch rowType {
        case .fullName:   return image
        default: return ""
        }
    }
    
    // MARK: - Init
    init(rowType: ProfileViewController.RowType, data: ProfileData) {
        self.rowType = rowType
        self.resultData = data
    }
}
