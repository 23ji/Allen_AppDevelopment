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
    self.tableView.delegate = self
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    movie.movieArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
    
    cell.movieImage.image = movie.movieArr[indexPath.row].movieImage
    cell.movieName.text = movie.movieArr[indexPath.row].movieName
    cell.descriptionLabel.text = movie.movieArr[indexPath.row].descriptionLabel
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toDetail", sender: indexPath)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetail" {
      let detailVC = segue.destination as! DetailViewController
      
      let array = movie.movieArr
      
      let indexPath = sender as! IndexPath
      
      detailVC.movieData = array[indexPath.row]
    }
  }
}
