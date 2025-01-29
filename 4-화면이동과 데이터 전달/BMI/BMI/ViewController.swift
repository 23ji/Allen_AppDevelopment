//
//  ViewController.swift
//  BMI
//
//  Created by Allen H on 2021/12/12.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    }
    
    func configureUI() {
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.layer.cornerRadius = 5
        //입력창의 회색 글씨
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }
    
    // BMI계산하기 - 버튼 누르면(다음화면)
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
}
