//
//  DetailVC.swift
//  LoodosTask
//
//  Created by Cem Eke on 4.12.2021.
//

import Foundation
import UIKit
import Kingfisher
import Firebase

class DetailVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRated: UILabel!
    @IBOutlet weak var lblReleased: UILabel!
    
    let ref = Database.database().reference(withPath: "movie-items")
    var refObservers: [DatabaseHandle] = []
    
    var movieDetail: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addItemToFirebaseDB()
    }
    
}

extension DetailVC {
    func setupUI(){
        
        imageView.kf.setImage(with: URL(string: movieDetail?.poster ?? ""))
        lblTitle.text = "Title : " + "\(movieDetail?.title ?? "")"
        lblRated.text = "Rated : " + "\(movieDetail?.rated ?? "")"
        lblYear.text = "Year : " + "\(movieDetail?.year ?? "")"
        lblReleased.text = "Released : " + "\(movieDetail?.released ?? "")"
        
    }
    
    func addItemToFirebaseDB() {
       
          // 1
          guard
            let title = self.movieDetail?.title,
            let rated = self.movieDetail?.rated,
            let year = self.movieDetail?.year,
            let released = self.movieDetail?.released,
            let poster = self.movieDetail?.poster
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

}


