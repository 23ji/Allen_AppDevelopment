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
        
        //🟡 전달된 값을 BMILael에 담아서 표시함
        BMILabel.text = BMINumber
        setup()
        
    }
    
    func setup() {
        BMILabel.layer.cornerRadius = 10
        BMILabel.clipsToBounds = true
        
        //🟡 BMI 결과값에 따라 표시 구현
        //🔹 BMINumber를 Double로 변환
        if let bmi = Double(BMINumber ?? "") {
            switch bmi {
            case ..<18.5:
                BMILabel.backgroundColor = .black
                descriptionLaabel.text = "저체중"
            case 18.5..<23.0:
                BMILabel.backgroundColor = .blue
                descriptionLaabel.text = "표준"
            case 23.0..<25.0:
                BMILabel.backgroundColor = .yellow
                descriptionLaabel.text = "과체중"
            case 25.0..<30.0:
                BMILabel.backgroundColor = .orange
                descriptionLaabel.text = "중도비만"
            case 30.0...:
                BMILabel.backgroundColor = .red
                descriptionLaabel.text = "고도비만"
            default:
                BMILabel.backgroundColor = .gray
            }
        } else {
            BMILabel.backgroundColor = .gray // 숫자로 변환 실패 시 기본값 설정
        }
    }

    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
