//
//  MovieManager.swift
//  TableView-23G
//
//  Created by 이상지 on 4/19/25.
//

import UIKit

struct MovieManager {
  
  var movieArr: [Movie] = [
    Movie(movieImage: UIImage(named: "batman.png"), movieName: "베트맨", descriptionLabel: "베트맨이 나오는 영화")
  ]
  
  mutating func updateMovie() {
    let movie = Movie(movieImage: UIImage(named: "batman.png"), movieName: "베트맨", descriptionLabel: "베트맨이 나오는 영화")
    movieArr.append(movie)
  }
}

