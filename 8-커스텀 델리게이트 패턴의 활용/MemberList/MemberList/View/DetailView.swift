//
//  DetailView.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import UIKit

final class DetailView: UIView {
  
  var member: Member? {
    didSet {
      guard var member = member else {
        saveButton.setTitle("SAVE", for: .normal)
        memberIdTextField.text = "\(Member.memberNumbers)"
        return
      }
      mainImageView.image = member.memberImage
      memberIdTextField.text = "\(member.memberId)"
      nameTextField.text = member.name
      phoneNumberTextField.text = member.phone
      addressTextField.text = member.address
      
      ageTextField.text = member.age != nil ? "\(member.age!)" : ""
    }
  }
  
  //MARK: - UI구현
  
  let mainImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .lightGray
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 75
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // 정렬을 깔끔하게 하기 위한 컨테이너뷰
  lazy var imageContainView: UIView = {
    let view = UIView()
    view.addSubview(mainImageView)
    //view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let memberIdLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "멤버번호:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let memberIdTextField: UITextField = {
    let tf = UITextField()
    tf.frame.size.height = 22
    tf.textColor = .black
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.clearsOnBeginEditing = false
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var memberIdStackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
    stview.spacing = 5
    stview.axis = .horizontal
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "이       름:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let nameTextField: UITextField = {
    let tf = UITextField()
    tf.frame.size.height = 22
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.clearsOnBeginEditing = false
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var nameStackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
    stview.spacing = 5
    stview.axis = .horizontal
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  let ageLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "나       이:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let ageTextField: UITextField = {
    let tf = UITextField()
    tf.frame.size.height = 22
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.clearsOnBeginEditing = false
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var ageStackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
    stview.spacing = 5
    stview.axis = .horizontal
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  let phoneNumberLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "전화번호:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let phoneNumberTextField: UITextField = {
    let tf = UITextField()
    tf.frame.size.height = 22
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.clearsOnBeginEditing = false
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var phoneNumberStackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
    stview.spacing = 5
    stview.axis = .horizontal
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "주       소:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let addressTextField: UITextField = {
    let tf = UITextField()
    tf.frame.size.height = 22
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.clearsOnBeginEditing = false
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var addressStackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
    stview.spacing = 5
    stview.axis = .horizontal
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  let saveButton: UIButton = {
    let button = UIButton(type: .custom)
    button.backgroundColor = .systemBlue
    button.setTitle("UPDATE", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.frame.size.height = 40
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var stackView: UIStackView = {
    let stview = UIStackView(arrangedSubviews: [imageContainView, memberIdStackView, nameStackView, ageStackView, phoneNumberStackView, addressStackView, saveButton])
    stview.spacing = 10
    stview.axis = .vertical
    stview.distribution = .fill
    stview.alignment = .fill
    stview.translatesAutoresizingMaskIntoConstraints = false
    return stview
  }()
  
  // 레이블 넓이 저장을 위한 속성
  let labelWidth: CGFloat = 70
  // 애니메이션을 위한 속성 선언
  var stackViewTopConstraint: NSLayoutConstraint!
  
  //MARK: - 생성자 셋팅
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupStackView()
    //setupNotification()
    //setupMemberIdTextField()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupStackView() {
    self.addSubview(stackView)
  }
  
  
  //MARK: - 오토레이아웃 셋팅
  
  // 오토레이아웃 업데이트
  override func updateConstraints() {
    setConstraints()
    super.updateConstraints()
  }
  
  func setConstraints() {
    
    NSLayoutConstraint.activate([
      mainImageView.heightAnchor.constraint(equalToConstant: 150),
      mainImageView.widthAnchor.constraint(equalToConstant: 150),
      mainImageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor),
      mainImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      imageContainView.heightAnchor.constraint(equalToConstant: 180)
    ])
    
    NSLayoutConstraint.activate([
      memberIdLabel.widthAnchor.constraint(equalToConstant: labelWidth),
      nameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
      ageLabel.widthAnchor.constraint(equalToConstant: labelWidth),
      phoneNumberLabel.widthAnchor.constraint(equalToConstant: labelWidth),
      addressLabel.widthAnchor.constraint(equalToConstant: labelWidth)
    ])
    
    stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
    
    NSLayoutConstraint.activate([
      stackViewTopConstraint,
      stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
    ])
  }
}

