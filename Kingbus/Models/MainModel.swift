//
//  MainModel.swift
//  Kingbus
//
//  Created by 이주성 on 1/3/25.
//

import Foundation
import Alamofire

final class MainModel {
    private(set) var loadSearchedPlaceDataRequest: DataRequest?
    
    func loadSearchedPlaceDataRequest(page: Int = 1, search: String, success: ((Search) -> ())?, failure: ((_ message: String) -> ())?) {
        let url = "https://dapi.kakao.com/v2/local/search/keyword.json"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": ReferenceValues.kakaoAuthKey
        ]
        
        let parameters: Parameters = [
            "page": page,
            "query": search,
        ]
        
        self.loadSearchedPlaceDataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        
        self.loadSearchedPlaceDataRequest?.responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else {
                    print("loadSearchedPlaceDataRequest failure: statusCode nil")
                    failure?("statusCodeNil")
                    
                    return
                }
                
                guard statusCode >= 200 && statusCode < 300 else {
                    print("loadSearchedPlaceDataRequest failure: statusCode(\(statusCode))")
                    failure?("statusCodeError")
                    
                    return
                }
                
                if let decodedData = try? JSONDecoder().decode(Search.self, from: data) {
                    print("loadSearchedPlaceDataRequest succeeded")
                    success?(decodedData)
                    
                } else {
                    print("loadSearchedPlaceDataRequest failure: API 성공, Parsing 실패")
                    failure?("API 성공, Parsing 실패")
                }
                
            case .failure(let error):
                print("loadSearchedPlaceDataRequest error: \(error.localizedDescription)")
                failure?(error.localizedDescription)
            }
        }
    }
}

// MARK: KAKAO Search Model
struct Search: Codable {
    let meta: SearchMeta
    let documents: [SearchData]
    
}

struct SearchMeta: Codable {
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
    }
}

struct SearchData: Codable {
    let id: String
    let placeName: String
    let addressName: String
    let roadAddressName: String
    let longitude: String
    let latitude: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case placeName = "place_name"
        case addressName = "address_name"
        case roadAddressName = "road_address_name"
        case longitude = "x"
        case latitude = "y"
    }
}
