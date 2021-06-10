//
//  DetailViewController.swift
//  TopTen
//
//  Created by Jessica Vera Perez on 09/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Propierties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addInfoMovie(in: self.movie!)
    }
    
    func addInfoMovie(in view: MovieModel) {
        self.titleLabel.text = view.originalTitle
        self.descriptionLabel.text = view.overview
        self.dateLabel.text = view.date
        self.ratingLabel.text = "\(view.popularity)"
    }

}
