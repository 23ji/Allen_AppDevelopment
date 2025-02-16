//
//  MyButton.swift
//  ViewCycle
//
//  Created by Allen H on 2022/01/20.
//

import UIKit

final class MyButton: UIButton {

    var onAndOff = false
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //토글이란 함수를 만들어서 구현
    func toggle() {
        self.onAndOff.toggle()
    }
    
    //layoutSubviews에
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
    }
    
}
