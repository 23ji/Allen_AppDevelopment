//
//  DetailViewController.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import UIKit

class DetailViewController: UIViewController {
  
  private let detailView = DetailView()
  
  var member: Member?
  
  
  override func loadView() {
    view = detailView
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDatas()
    setupButtonAction()
  }
  
  
  func setupDatas() {
    detailView.member = member
  }
  
  
  func setupButtonAction() {
    detailView.saveButton.addTarget(self, action: #selector(saveButtonTappped), for: .touchUpInside)
  }
  
  @objc func saveButtonTappped() {
    if member == nil {
      
    } else {
      member?.memberImage = detailView.mainImageView.image
      
      let memberId = Int(detailView.memberIdTextField.text!) ?? 0
      member!.name = detailView.nameTextField.text ?? ""
      member!.address = detailView.addressTextField.text ?? ""
      member!.phone = detailView.phoneNumberTextField.text ?? ""
      member!.age = Int(detailView.ageTextField.text!) ?? 0
      
      // 방법 1
      // 0 을 만들기 위해
      let index = navigationController!.viewControllers.count - 2
      
      let vc = navigationController?.viewControllers[index] as! ViewController
      
      vc.memberListManager.updateMemberInfo(index: memberId, member!)
      
      // 방법 2
      
    }
    self.navigationController?.popViewController(animated: true)
    print("버튼 눌림")
  }
}
