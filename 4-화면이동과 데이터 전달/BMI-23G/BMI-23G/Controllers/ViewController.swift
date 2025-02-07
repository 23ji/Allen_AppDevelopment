//
//  ViewController.swift
//  BMI-23G
//
//  Created by 이상지 on 1/29/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UITextField!
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    //소통을 위해 인스턴스 생성 후 변수에 넣어둠!
    var bmiManager = BMICalculratorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        guard let BMIVC = storyboard?.instantiateViewController(withIdentifier: "BMIVC") as? BMIViewController else { return }
        
        bmiManager.calculateBMI(for: BMIVC)
        //calculateBMI(for: BMIVC)
        
        self.present(BMIVC, animated: true, completion: nil)
        
    }    
}

