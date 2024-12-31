//
//  ServerSetting.swift
//  Universal
//
//  Created by Awesomepia on 2023/03/29.
//

import Foundation

struct ServerSetting {
    static let server: Server = .DEV
    
    // MARK: DEV v1.0.0(3) - 2024/12/31
    
    enum Server: String {
        case DEV
        
        case QA
        
        case RELEASE
        
        var URL: String {
            switch self {
            case .DEV:
                return "http://35.232.227.58"
                
            case .QA:
                return ""
                
            case .RELEASE:
                return ""
            }
        }
        
    }
}
