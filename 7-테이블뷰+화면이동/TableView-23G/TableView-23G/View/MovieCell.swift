//
//  MovieCell.swift
//  TableView-23G
//
//  Created by 이상지 on 4/19/25.
//

import UIKit

class MovieCell: UITableViewCell {
  
  @IBOutlet weak var movieImage: UIImageView!
  @IBOutlet weak var movieName: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
