//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 이상지 on 11/2/24.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    //UIViewController를 상속한 ViewController
    // 클래스명은 대문자로 시작
    
    
    @IBOutlet weak var mainLable: UILabel!
    //변수명(속성)은 소문자로 시작, 약한 참조
    //UILable 타입인 속성
    
    @IBOutlet weak var slider: UISlider!
    //UI에 영향을 끼쳐야하기 떄문에 아울렛
    
    //힙에 저장되니 약한 참조로,,
    weak var timer: Timer?

    var number: Int = 0
    
    
    
    override func viewDidLoad() {
        //상위(ViewController)에 정의된 viewDidLoad를 재정의
        //앱의 화면에 들어오면 처음 보이는 화면
        super.viewDidLoad()
        
        configureUI()
        //코드를 깔끔히 정리하기 위해 여기서 정의하는게 아니라 아래에서 함수로 만들어 여기서 호출!
    }
    
    func configureUI() {
        mainLable.text = "초를 선택하세요"
        //슬라이더 가운데 설정이 필요
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        //값이 변할 때 마다 호출
        //슬라이더의 밸류값을 가지고 메인레이블의 텍스트를 셋팅
        number = Int(sender.value * 60) //value 가 0~1 사이이기 떄문에
        mainLable.text = "\(number)초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //1초가 지나갈 때마다 실행되는 코드 구현
        
        timer?.invalidate()
        
        // 🍑 셀럭서 사용하는 방법
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        // 셀렉터는 objc에서 사용하던 메모리 주소를 담아서 어떤 함수를 가르킬건지 연결하는 것
        
        //🍑 클로저 사용하는 방법
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
//            //반복하고 싶은 코드 작성
//            
//            if number > 0 {
//                number -= 1
//                //슬라이더도 줄여야함
//                slider.value = Float(number) / Float(60)
//                //레이블 표시도 새로 해줘야함
//                mainLable.text = "\(number)초"
//            }else{
//                number = 0
//                mainLable.text = "초를 선택하시오"
//                //마지막에 0이 됐을 때 소리가 나게
//                timer?.invalidate() //타이머 비활성화
//                AudioServicesPlaySystemSound(SystemSoundID(1005))
//            }
//        })
    }
    
    //🍑 셀럭터 사용 시 필요
    @objc func doSomethingAfter1Second(){
        if number > 0 {
            number -= 1
            //슬라이더도 줄여야함
            slider.value = Float(number) / Float(60)
            //레이블 표시도 새로 해줘야함
            mainLable.text = "\(number)초"
        }else{
            number = 0
            mainLable.text = "초를 선택하시오"
            timer?.invalidate() //타이머 비활성화
            timer = nil
            //마지막에 0이 됐을 때 소리가 나게
            AudioServicesPlaySystemSound(SystemSoundID(1005))
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLable.text = "초를 선택하세요"
        //슬라이더 가운데 설정이 필요
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
        timer = nil
    }
}

