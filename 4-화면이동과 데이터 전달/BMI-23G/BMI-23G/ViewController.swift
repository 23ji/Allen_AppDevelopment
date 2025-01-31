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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        guard let BMIVC = storyboard?.instantiateViewController(withIdentifier: "BMIVC") as? BMIViewController else { return }
        
        calculateBMI(for: BMIVC)
        
        self.present(BMIVC, animated: true, completion: nil)
        
    }
    
    func calculateBMI(for viewController: BMIViewController) {
        guard let heightText = heightLabel.text, let weightText = weightLabel.text,
              let heightCm = Double(heightText), let weight = Double(weightText), heightCm > 0 else {
            viewController.BMINumber = "입력 오류"
            return
        }
        
        let height = heightCm / 100 // cm → m 변환
        let BMI = weight / (height * height) // BMI 계산
        
        viewController.BMINumber = String(format: "%.2f", BMI) // 소수점 2자리까지 표시
    }


    
}

