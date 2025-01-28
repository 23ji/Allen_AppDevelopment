//
//  ViewController.swift
//  BMI
//
//  Created by 이상지 on 1/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField! // 키 입력 필드
    @IBOutlet weak var weightTextField: UITextField! // 몸무게 입력 필드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기 설정
        //mainLabel.text = "BMI 계산기"
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // 키와 몸무게를 안전하게 가져오기
        guard let heightText = heightTextField.text,
              let weightText = weightTextField.text,
              let height = Double(heightText),
              let weight = Double(weightText) else {
            //mainLabel.text = "키와 몸무게를 확인해주세요!"
            return
        }
        
        // BMI 계산: 키는 cm -> m 변환 필요
        let bmi = weight / ((height / 100) * (height / 100))
        let formattedBMI = String(format: "%.2f", bmi) // 소수점 2자리로 포맷팅
        
        // BMI 상태 결정
        let status: String
        switch bmi {
        case ..<18.5:
            status = "저체중"
        case 18.5..<24.9:
            status = "정상 체중"
        case 25..<29.9:
            status = "과체중"
        default:
            status = "비만"
        }
        
        // BMI 값을 새로운 화면에 전달
        guard let BMIVC = storyboard?.instantiateViewController(withIdentifier: "BMIVC") as? BMIViewController else { return }
        BMIVC.BMILable = formattedBMI // BMI 값 전달
        BMIVC.secondLabel = status // 상태 메시지 전달
        self.present(BMIVC, animated: true, completion: nil)
    }
}
