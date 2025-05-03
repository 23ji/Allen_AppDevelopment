//
//  Member.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import Foundation

struct Member {
  static var memberNumbers: Int = 0
  
  let memberId: Int
  var name: String?
  var age: Int?
  var phone: String?
  var address: String?
  
  init(name: String, age: Int, number: String, address: String) {
    self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
    
    self.name = name
    self.age = age
    self.phone = number
    self.address = address
    
    Member.memberNumbers += 1
  }
}
