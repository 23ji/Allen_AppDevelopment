//
//  ViewController.swift
//  TableView-23G
//
//  Created by 이상지 on 3/9/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var movieArray: [Movie] = [
        Movie(mainImageView: UIImage(named: "batman.png"), movieNameLabel: "베트맨", movieDescriptionLable: "베트맨이 나오는 영화"),
        Movie(mainImageView: UIImage(named: "hulk.png"), movieNameLabel: "헐크", movieDescriptionLable: "헐크가 나오는 영화")
    ]

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImageView.image = movieArray[indexPath.row].mainImageView
        cell.movieNameLabel.text = movieArray[indexPath.row].movieNameLabel
        cell.movieDescriptionLable.text = movieArray[indexPath.row].movieDescriptionLable
        
        return cell
    }


}

