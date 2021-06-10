//
//  ListViewModel.swift
//  TopTen
//
//  Created by Jessica Vera Perez on 08/06/21.
//

import Foundation

class ListViewModel {
    var refeshData = { () -> () in }
    var dataArray: [MovieModel] = [] {
        didSet {
            refeshData()
        }
    }
    /*
     func getJsonMovie() -> [String] {
     let url = URL(string: Constants.url)
     var request = URLRequest(url: url!)
     request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
     request.httpMethod = "GET"
     
     let task = URLSession.shared.dataTask(with: request) { data, response , error in
     guard let data = data,
     let response = response as? HTTPURLResponse,
     error == nil else {
     print("Erron in response: \(error)")
     return
     }
     
     do {
     if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any], let jsonRespond = json["results"] as? [String:Any] {
     //                    if let jsonMovie = json["results"] as? [[String: Any]] {
     print(jsonRespond)
     //                        self.createArrayMovie(arrayData: jsonMovie)
     //                    self.createArrayMovie(arrayData: jsonRespond)
     self.dataArray = self.createArrayMovie(arrayData: jsonRespond)
     //                    }
     
     }
     } catch let error {
     print("Error: \(error)")
     }
     
     }.resume()
     
     
     return []
     }
     
     func getMovie() {
     let url = URL(string: Constants.url)
     URLSession.shared.dataTask(with: url!) { data, response, error in
     guard let json = data else { return }
     do {
     if let jsonData = try JSONSerialization.jsonObject(with: json, options: []) as? [String:[String:Any]], let jsonResponse = jsonData["results"] as? [String:Any] {
     print("JSON RESPONSE: \(jsonResponse)")
     print("-------------")
     self.dataArray = self.createArrayMovie(arrayData: jsonResponse)
     print("DATA ARRAY: \(self.dataArray)" )
     print("-------------")
     
     }
     } catch let error {
     print("Error: Ha ocurrido un error: \(error.localizedDescription)")
     }
     }.resume()
     }*/
    
    func getMovie() {
        let url = URL(string: Constants.url)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse, error == nil else  {
                print("Error response")
                return
            }
            
            do {
                print(data)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                let jsonResult = json?["results"] as? [[String : Any]]
                print("---------")
                print(json)
                print("...........")
                print(jsonResult)
                print("----------")
                
                self.dataArray = self.createArrayMovie(arrayData: jsonResult!)
                print(self.dataArray)
                print("------------")
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func createArrayMovie(arrayData: [[String:Any]]) -> [MovieModel]{
        var arrayMovieData: [MovieModel] = []
        for movie in arrayData {
            let arrayMovie = MovieModel(id: movie["id"] as! Int,
                                        language: movie["original_language"] as! String,
                                        originalTitle: movie["original_title"] as! String,
                                        overview: movie["overview"] as! String,
                                        popularity: movie["popularity"] as! Double,
                                        posterPath: movie["poster_path"] as! String,
                                        date: movie["release_date"] as! String,
                                        title: movie["title"] as! String,
                                        video: movie["video"] as! Bool,
                                        voteAverage: movie["vote_average"] as! Double,
                                        voteCount: movie["vote_count"] as! Int)
            
            arrayMovieData.append(arrayMovie)
            
            print(movie)
        }
        
        return arrayMovieData
    }
}
