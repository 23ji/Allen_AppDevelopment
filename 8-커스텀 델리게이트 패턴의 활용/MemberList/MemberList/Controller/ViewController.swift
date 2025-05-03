//
//  ViewController.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import UIKit

final class ViewController: UIViewController {
  
  private let tableView = UITableView()
  
  var memberListManager = MemberListManager()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    memberListManager.makeMembersListData()
    tableView.dataSource = self
    setupNaviBar()
    setupTableViewConstraints()
  }
  
  
  func setupNaviBar() {
    title = "회원 목록"
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground() // 불투명
    appearance.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .systemBlue
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.compactAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
    // 내비게이션 바 상단 설정
    //self.navigationItem.rightBarButtonItem = self.plusButton
  }
  
  
  func setupTableViewConstraints() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ]
    )
  }
  
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    memberListManager.getMembersList().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
  
  
}

