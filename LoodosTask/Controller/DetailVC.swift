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
    private let viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.addItemToFirebaseDB(mv: movieDetail)
        viewModel.updateFirebaseAnalystics(mv: movieDetail)
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
    
    
    

}


