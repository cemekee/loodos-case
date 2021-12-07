//
//  NetworkManager+JSON.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation

extension NetworkManager {
    static func toParameters<T:Encodable>(model: T?) -> [String:AnyObject]?
    {
        if(model == nil)
        {
            return nil
        }
        
        let jsonData = modelToJson(model:model)
        let parameters = jsonToParameters(from: jsonData!)
        return parameters! as [String: AnyObject]
    }
    
    static func modelToJson<T:Encodable>(model:T)  -> Data?
    {
        return try! JSONEncoder().encode(model.self)
    }


    static func jsonToParameters(from data: Data) -> [String: Any]?
    {
        return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    }
}

    

