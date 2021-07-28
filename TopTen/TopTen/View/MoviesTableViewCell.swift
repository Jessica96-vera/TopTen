//
//  MoviesTableViewCell.swift
//  TopTen
//
//  Created by Jessica Vera Perez on 08/06/21.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func getData(movie: MovieModel) {
        
        self.titleMovie.text = movie.title
        self.dateMovie.text = movie.date
        self.imageView?.loadImage(url: URL(string: movie.posterPath)!)
        
    }
    
}

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
