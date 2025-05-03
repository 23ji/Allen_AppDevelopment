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
    view.backgroundColor = .white
    setupDatas()
    setupTableView()
    setupNaviBar()
    setupTableViewConstraints()
  }
  
  
  func setupDatas() {
    memberListManager.makeMembersListData()
  }
  
  
  func setupTableView() {
    tableView.dataSource = self
    tableView.rowHeight = 60
    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
    
    //MARK: 방법 1
    
    cell.member = memberListManager[indexPath.row]
    cell.selectionStyle = .none
    
    //MARK: 방법 2
    //    cell.mainImageView.image = memberListManager[indexPath.row].memberImage
    //    cell.memberNameLabel.text = memberListManager[indexPath.row].name
    //    cell.addressLabel.text = memberListManager[indexPath.row].address
    //    cell.selectionStyle = .none
    
    return cell
  }
  
  
}

