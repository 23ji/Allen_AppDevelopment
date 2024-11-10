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
        //🍑 텍스트 필드에 어떠한 이벤트가 일어나면 대리자(delegate)에게 호출/전달
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .continue
        //🍑텍스트 필드가 first 응답 객체가 된다.
        //🍑 결론 : 텍스트필드를 눌렀을 때 키보드를 올라오게하고 싶으면 아래 함수를 써주면 된다~
        textField.becomeFirstResponder()
    }

    // 🍑 일반적으로 메서드는 viewDidLoad 아래에!
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        //🍑Done 누르면 키보드 내려가는 함수
        textField.resignFirstResponder()
    }
    
    //🍑 이미 정의되어있는 touchBegan을 재정의해서 기능 구현하는 법 / 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil {
            return false
        }else{
            // 10글자 이상의 코드를 막는 방법
            // 🍑 아직 모든 코드를 이해하고 파악하기 보단 우선은 구글링으로 코드를 구현~
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    
    //🍑 텍스트 필드의 입력을 시작할 때 호출(시작(=입력)을 허락할 지 말지 허락)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 입력을 시작했다.")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

}

