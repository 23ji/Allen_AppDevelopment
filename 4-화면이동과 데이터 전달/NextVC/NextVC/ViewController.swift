//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someString = "문자열을 전달받아서 다음 화면에 나타냄"
        //firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        // 🍑 (애플이 만들어 놓은) 구체적이지 않은 타입이므로 타입 캐스팅을 통해 구체적으로
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController{
            secondVC.someString = "반가워요"

            present(secondVC, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        // 🍑 sender(보내는 것) = self = ViewController
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    // 🍑 데이터를 전달받으려면 어떤 메서드를 재정의해서 구현해줘야함 (위에처럼 일반적인 someString 불가)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC"{
            let thirdVC = segue.destination as! ThirdViewController
            // 데이터 전달
            thirdVC.someString = "세번째 화면입니다."
        }
    }

    
}

