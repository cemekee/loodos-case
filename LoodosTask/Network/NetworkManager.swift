//
//  NetworkManager.swift
//  LoodosTask
//
//  Created by Cem Eke on 3.12.2021.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let instance = NetworkManager()
    private let parse = Response()
    
    let headers : HTTPHeaders = [
        "Accept": "*/*",
        "User-Agent": "Mozilla/5.0 (compatible; Rigor/1.0.0; http://rigor.com)"
    ]
    
    public func fetch<T:Codable> (_ method: HTTPMethod, url: String, requestModel: T?, model: T.Type, completion: @escaping (AFResult<Codable>) -> Void)
    {
        AF.request(
            url,
            method: method,
            parameters: NetworkManager.toParameters(model: requestModel),
            encoding: JSONEncoding.default,
            headers: headers
        )
            .validate()
            .responseJSON { [weak self] response in
                self?.parse.parseJSON(response: response, model: model, completion: completion)
            }
    }
    
}



