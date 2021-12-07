//
//  Response.swift
//  LoodosTask
//
//  Created by Cem Eke on 4.12.2021.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit


class Response {
    func parseJSON<T:Codable>(response: AFDataResponse<Any>, model:T.Type, completion: @escaping (AFResult<Codable>) -> Void) {
        switch response.result {
        case .success(let value as [String: AnyObject]):
            do{
                let responseJsonData = JSON(value)
                let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                completion(.success(responseModel))
            }
            catch let parsingError{
                print("Success (error): \(parsingError)")
            }
            
        case .failure(let error):
            print("Failure: \(error)")
            completion(.failure(error))
            
        default: fatalError("Fatal error.")
            
        }
    }
}
