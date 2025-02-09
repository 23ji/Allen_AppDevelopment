//
//  BMICalculatorManager.swift
//  BMI-23G
//
//  Created by 이상지 on 2/7/25.
//

import Foundation

struct BMICalculatorManager{
            
    func calculateBMI(heightText: String?, weightText: String?) -> String {
        
        guard let heightText = heightText, let weightText = weightText, let heightCm = Double(heightText), let weight = Double(weightText)
        else { return "입력 오류" }
        
        let height = heightCm / 100
        let BMI = weight / (height * height)
        
        return String(format: "%.2f", BMI)
    }
}

