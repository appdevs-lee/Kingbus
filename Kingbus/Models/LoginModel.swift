//
//  LoginModel.swift
//  Kingbus
//
//  Created by 이주성 on 12/16/24.
//

import Foundation
import Alamofire

final class LoginModel {
    // 인증번호 전송
    private(set) var sendCodeDataRequest: DataRequest?
    // 인증번호 검증
    private(set) var verifyCodeDataRequest: DataRequest?
    // 로그인 및 회원가입
    private(set) var loginUserDataRequest: DataRequest?
    // Refresh toekn으로 access token 재발급
    private(set) var sendRefreshTokenDataReqeust: DataRequest?
    
    func sendCodeDataRequest(phoneNumber: String, success: (() -> ())?, failure: ((_ message: String) -> ())?) {
        let url = ServerSetting.server.URL + "/user/send-code"
        
        let headers: HTTPHeaders = [
            "accept":"application/json",
        ]
        
        var parameters: Parameters = [
            "phone_number": phoneNumber,
        ]
        
        self.sendCodeDataRequest = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.sendCodeDataRequest?.responseData { (response) in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else {
                    print("sendCodeDataRequest failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("sendCodeDataRequest failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                print("sendCodeDataRequest succeeded")
                success?()
                
            case .failure(let error):
                print("sendCodeDataRequest error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
    
    func verifyCodeDataRequest(phoneNumber: String, code: Int, success: ((Bool) -> ())?, failure: ((_ message: String) -> ())?) {
        let url = ServerSetting.server.URL + "/user/verify-code"
        
        let headers: HTTPHeaders = [
            "accept":"application/json",
        ]
        
        var parameters: Parameters = [
            "phone_number": phoneNumber,
            "verification_code": code,
        ]
        
        self.verifyCodeDataRequest = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.verifyCodeDataRequest?.responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else {
                    print("verifyCodeDataRequest failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("verifyCodeDataRequest failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                if let decodedData = try? JSONDecoder().decode(VerifyCode.self, from: data) {
                    print("verifyCodeDataRequest succeeded")
                    success?(decodedData.result)
                    
                } else {
                    print("verifyCodeDataRequest failure: API 성공, Parsing 실패")
                    failure?("API 성공, Parsing 실패")
                }
                
            case .failure(let error):
                print("verifyCodeDataRequest error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
    
    func loginUserDataRequest(name: String, phoneNumber: String, success: ((LoginItem) -> ())?, failure: ((_ message: String) -> ())?) {
        let url = ServerSetting.server.URL + "/user/login"
        
        let headers: HTTPHeaders = [
            "accept":"application/json",
        ]
        
        var parameters: Parameters = [
            "username": name,
            "phone_number": phoneNumber,
        ]
        
        self.loginUserDataRequest = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.loginUserDataRequest?.responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else {
                    print("loginUserDataRequest failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("loginUserDataRequest failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                if let decodedData = try? JSONDecoder().decode(Login.self, from: data) {
                    print("loginUserDataRequest succeeded")
                    ReferenceValues.accessToken = decodedData.data.access
                    ReferenceValues.refreshToken = decodedData.data.refresh
                    ReferenceValues.name = decodedData.data.username ?? ""
                    success?(decodedData.data)
                    
                } else {
                    print("loginUserDataRequest failure: API 성공, Parsing 실패")
                    failure?("API 성공, Parsing 실패")
                }
                
            case .failure(let error):
                print("loginUserDataRequest error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
    
    func sendRefreshTokenDataReqeust(success: ((LoginItem) -> ())?, failure: ((_ message: String) -> ())?) {
        let url = ServerSetting.server.URL + "/user/refresh-token"
        
        let headers: HTTPHeaders = [
            "accept":"application/json",
        ]
        
        var parameters: Parameters = [
            "refresh": ReferenceValues.refreshToken,
        ]
        
        self.sendRefreshTokenDataReqeust = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.sendRefreshTokenDataReqeust?.responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else {
                    print("sendRefreshTokenDataReqeust failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("sendRefreshTokenDataReqeust failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                if let decodedData = try? JSONDecoder().decode(Login.self, from: data) {
                    print("sendRefreshTokenDataReqeust succeeded")
                    ReferenceValues.accessToken = decodedData.data.access
                    ReferenceValues.refreshToken = decodedData.data.refresh
                    success?(decodedData.data)
                    
                } else {
                    print("sendRefreshTokenDataReqeust failure: API 성공, Parsing 실패")
                    failure?("API 성공, Parsing 실패")
                }
                
            case .failure(let error):
                print("sendRefreshTokenDataReqeust error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
}

struct Login: Codable {
    let data: LoginItem
}

struct LoginItem: Codable {
    let refresh: String
    let access: String
    
    let username: String?
}

struct VerifyCode: Codable {
    let result: Bool
}
