//
//  ViewController.swift
//  TopTen
//
//  Created by Jessica Vera Perez on 08/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ListViewModel()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateView()
        self.bind()
    }
    
    func configurateView() {
        self.tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.viewModel.getJsonMovie()
        self.viewModel.getMovie()
        
    }
    
    func bind() {
        viewModel.refeshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            var movie: MovieModel?
            let destinationVC = segue.destination as! DetailViewController
            movie = viewModel.dataArray[index]
            if let selectMovie = movie {
                destinationVC.movie = selectMovie
            }
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        let movieObject = viewModel.dataArray[indexPath.row]
//        cell.titleMovie.text = movieObject.title
        
        cell.getData(movie: movieObject)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        index = indexPath.row
        performSegue(withIdentifier: "detail", sender: self)
        return indexPath
    }
}

