//
//  EndpointType.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import Foundation
import Alamofire

public protocol EndPointType {
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
    var headers: HTTPHeaders { get }
    var path: String { get }
}

public enum HTTPTask {
    case request
    case requestWithParameters(parameters: Parameters)
    case requestWithMultipartData(data: Any, parameters: Parameters, dataParameterName: String)
    case requestWithMultipartDatas(datas: [String: Any], parameters: Parameters)
}

public enum Result<T> {
    case success(T)
    case failure(String)
}
