//
//  FourthViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "네번쨰"
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
