//
//  BMIViewController.swift
//  BMI
//
//  Created by 이상지 on 1/28/25.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet weak var BMILabel: UILabel! // BMI 값을 표시할 레이블
    @IBOutlet weak var secondLabelView: UILabel! // 상태 메시지를 표시할 레이블
    @IBOutlet weak var backButton: UIButton! // 돌아가기 버튼

    var BMILable: String? // 이전 화면에서 전달받은 BMI 값
    var secondLabel: String? // 이전 화면에서 전달받은 상태 메시지

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전달받은 값 표시
        BMILabel.text = BMILable
        secondLabelView.text = secondLabel
    }

    @IBAction func bckButtonTapped(_ sender: UIButton) {
        // 현재 화면 닫기
        self.dismiss(animated: true, completion: nil)
    }
}
