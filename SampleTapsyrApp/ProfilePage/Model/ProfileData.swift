//
//  ProfileData.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import Foundation

struct ProfileData: Decodable {
    let name: String?
    let avatar: String?
    let phone: String?
    let city: String?
    let email: String?
}
