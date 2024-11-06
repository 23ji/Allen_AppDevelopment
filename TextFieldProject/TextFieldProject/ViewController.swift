//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이상지 on 11/6/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // 🍑 UITextFieldDelegate 채택

    // 🍑 일반적으로 속성은 viewDidLoad 위에!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .google
    }

    // 🍑 일반적으로 메서드는 viewDidLoad 아래에!
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    // 🍑 return : Bool 타입 => 그 동작을 허락할지말지!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            textField.placeholder = "입력을 해야합니다."
            return false
        }else{
            return true
        }
    }
    
    
    // 텍스트 필드의 입력을 시작할 때 호출(시작(=입력)을 허락할 지 말지 허락)
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("유저가 입력을 시작했다.")
//    }
//    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return true
//    }

}

