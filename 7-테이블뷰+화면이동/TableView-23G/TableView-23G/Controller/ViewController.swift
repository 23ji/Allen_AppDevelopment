//
//  ViewController.swift
//  TableView-23G
//
//  Created by 이상지 on 4/19/25.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
  var movie = MovieManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
    
    cell.movieImage.image = movie.movieArr[indexPath.row].movieImage
    cell.movieName.text = movie.movieArr[indexPath.row].movieName
    cell.descriptionLabel.text = movie.movieArr[indexPath.row].descriptionLabel
    
    return cell
  }
  
  
}
