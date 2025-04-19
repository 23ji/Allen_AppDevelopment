//
//  DetailViewController.swift
//  TableView-23G
//
//  Created by 이상지 on 4/19/25.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var movieImage: UIImageView!
  
  @IBOutlet weak var movieName: UILabel!
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var movieData: Movie?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    movieImage.image = movieData?.movieImage
    movieName.text = movieData?.movieName
    descriptionLabel.text = movieData?.descriptionLabel
    print(movieName.text)
  }
}
