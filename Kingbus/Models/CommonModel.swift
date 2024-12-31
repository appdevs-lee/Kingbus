//
//  CommonModel.swift
//  Kingbus
//
//  Created by 이주성 on 12/16/24.
//

import Foundation
import Alamofire

final class CommonModel {
    // FCM Token 등록
    private(set) var registerFCMTokenDataRequest: DataRequest?
    
    func registerFCMTokenDataRequest(success: (() -> ())?, failure: ((_ message: String) -> ())?) {
        let url = ServerSetting.server.URL + "/users/fcm-token"
        
        let headers: HTTPHeaders = [
            "accept":"application/json",
            "Authorization": ReferenceValues.accessToken
        ]
        
        let parameters: Parameters = [
            "token": ReferenceValues.fcmToken,
        ]
        
        self.registerFCMTokenDataRequest = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.registerFCMTokenDataRequest?.responseData { (response) in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else {
                    print("registerFCMTokenDataRequest failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("registerFCMTokenDataRequest failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                print("registerFCMTokenDataRequest succeeded")
                success?()
                
            case .failure(let error):
                print("registerFCMTokenDataRequest error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
}
