//
//  MemberListManager.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import Foundation

// 비즈니스 로직을 위한 모델

final class MemberListManager {
  
  private var memberList:[Member] = []
  
  func makeMembersListData() {
    memberList = [
      Member(name: "홍길동", age: 12, number: "010-2222-2222", address: "서울"),
      Member(name: "임꺽정", age: 12, number: "010-2222-2222", address: "서울"),
      Member(name: "스티브", age: 12, number: "010-2222-2222", address: "서울")
    ]
  }
  
  
  // 전체 멤버 리스트 얻기
  func getMembersList() -> [Member]{
    memberList
  }
  
  
  // 새로운 멤버 만들기
  func makeNewMember(_ member: Member){
    memberList.append(member)
  }
  
  
  // 기존 멤버 정보 업데이트
  func updateMemberInfo(index: Int, _ member: Member){
    memberList[index] = member
  }
  
  
  // 특정 멤버 찾기(필요없지만, 서브스크립트 연습을 위해...)
  subscript(index: Int) -> Member {
    get{
      return memberList[index]
    }
    set{
      memberList[index] = newValue
    }
  }
}
