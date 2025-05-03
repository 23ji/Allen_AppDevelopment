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
    print("버튼 눌림")
  }
}
