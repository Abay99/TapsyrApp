//
//  Requests.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import Foundation
import SVProgressHUD

class Request {
    private let networkManager: NetworkManager = NetworkManager()
    static let shared = Request()
    
    init() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.lightGray)
        SVProgressHUD.setBackgroundColor(.clear)
    }
}

//MARK: - POST requests
extension Request {
    func postUserAuthentication(
        token: String,
        params: [String: String],
        completionHandler: @escaping ((ProfileData)->Void),
        completionHandlerError: @escaping ((String)->Void)
        ) -> Void {
        let endpoints = Endpoints.postUserAuthentication(token: token, parameters: params)
        SVProgressHUD.show()
        networkManager.makeRequest(endpoint: endpoints) {(result: Result<ProfileData>) in
            SVProgressHUD.dismiss()
            switch result {
            case .failure(let error):
                completionHandlerError(error)
            case .success(let response):
                completionHandler(response)
            }
        }
    }
}
