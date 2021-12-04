//
//  DetailVM.swift
//  LoodosTask
//
//  Created by Cem Eke on 4.12.2021.
//

import Foundation
import Firebase
                
class DetailVM {
    let ref = Database.database().reference(withPath: "movie-items")
    var refObservers: [DatabaseHandle] = []
    
  
    func addItemToFirebaseDB(mv: Movie?) {
           
              // 1
              guard
                let title = mv?.title,
                let rated = mv?.rated,
                let year = mv?.year,
                let released = mv?.released,
                let poster = mv?.poster
              else { return }
              
              // 2
                let movieItem = Movie(
                    title: title,
                    year: year,
                    rated: rated,
                    released: released,
                    poster: poster )

              // 3
            let movieTitle = movieItem.title.replacingOccurrences(of: ".", with: ",")
            let movieItemRef = self.ref.child(movieTitle.lowercased())
               
              // 4
                movieItemRef.setValue(movieItem.title)
            
            
        }
    
    func updateFirebaseAnalystics(mv:Movie?) {
          Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-\(mv?.title)",
            AnalyticsParameterItemName: mv?.title
        ])
        
    }
    
}
