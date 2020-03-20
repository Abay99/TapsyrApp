//
//  Endpoints.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import Alamofire

enum Endpoints: EndPointType {

    case postUserAuthentication(token: String, parameters: Parameters)
    
    var httpMethod: HTTPMethod {
        switch self {
        case .postUserAuthentication(_, _):
            return .post
        }
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .postUserAuthentication(_, let params):
            return .requestWithParameters(parameters: params)
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .postUserAuthentication(let token, _):
            return ["Authorization": token]
        }
    }
    
    var path: String {
        switch self {
        case .postUserAuthentication(_, _):
            return "http://iqlabs.kz/uparty/public/api/auth/login"
        }
    }
}
