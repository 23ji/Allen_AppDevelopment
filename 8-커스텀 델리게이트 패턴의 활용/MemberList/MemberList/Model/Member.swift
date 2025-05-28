//
//  Member.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import UIKit

// 클래스만 참조할 수 있도록
protocol MemberDelegate: AnyObject {
  func addNewMember(_ member: Member)
  func update(index: Int, _ member: Member)
}

// 데이터에 관한 모델

struct Member {
  lazy var memberImage: UIImage? = {
    guard let name = name else {
      return UIImage(systemName: "person")
    }
    return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
  }()
  
  
  static var memberNumbers: Int = 0
  
  let memberId: Int
  var name: String?
  var age: Int?
  var phone: String?
  var address: String?
  
  init(name: String, age: Int, number: String, address: String) {
    self.memberId = Member.memberNumbers
    
    self.name = name
    self.age = age
    self.phone = number
    self.address = address
    
    Member.memberNumbers += 1
  }
}
