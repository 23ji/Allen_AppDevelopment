//
//  BMIViewController.swift
//  BMI-23G
//
//  Created by 이상지 on 1/31/25.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var descriptionLaabel: UILabel!
    
    var BMINumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text = BMINumber
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
