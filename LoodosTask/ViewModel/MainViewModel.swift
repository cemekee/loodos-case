//
//  MainVM.swift
//  LoodosTask
//
//  Created by Cem Eke on 3.12.2021.
//

import Foundation
import Alamofire

class MainViewModel {
    
    var movie = Movie(title: "", year: "", rated: "", released: "", poster: "")
    var updateUI : ()->() = {}
    
    func fetchFilteredMovie(name: String) {
        
        NetworkManager.instance.fetch(HTTPMethod.get, url: "\(List.getAllUrl)\(name)" , requestModel: nil, model: Movie.self ) { [weak self] response in
            switch(response)
            {
            case .success(let model):
                let movieModel = model as! Movie
                print("JSON RESPONSE MODEL : \(String(describing: movieModel))")
                self?.movie = movieModel
                self?.updateUI()
                
            case .failure(_):
                break
            }
        }
    }
}
