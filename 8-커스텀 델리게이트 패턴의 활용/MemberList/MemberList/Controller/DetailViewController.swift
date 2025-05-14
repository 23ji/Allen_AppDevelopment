//
//  DetailViewController.swift
//  MemberList
//
//  Created by 이상지 on 5/3/25.
//

import UIKit
import PhotosUI


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
    setUpGestures()
  }
  
  
  func setupDatas() {
    detailView.member = member
  }
  
  
  func setupButtonAction() {
    detailView.saveButton.addTarget(self, action: #selector(saveButtonTappped), for: .touchUpInside)
  }
  
  
  func setUpGestures() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
    detailView.mainImageView.addGestureRecognizer(tapGesture)
    detailView.mainImageView.isUserInteractionEnabled = true
  }
  
  @objc func touchUpImageView() {
    print("image touch")
    setUpImagePicker()
  }
  
  
  func setUpImagePicker() {
    
    var configration = PHPickerConfiguration()
    configration.selectionLimit = 0
    configration.filter = .any(of: [.images, .videos])
    
    let picker = PHPickerViewController(configuration: configration)
    
    picker.delegate = self
    self.present(picker, animated: true, completion: nil)
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


extension DetailViewController: PHPickerViewControllerDelegate {
  // 아래 구현은 거의 템플릿임! 외우기보다는 그떄그때 구글링해서 쓰면 됨
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    picker.dismiss(animated: true)
    
    let itemProvider = results.first?.itemProvider
    
    if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
      itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
        DispatchQueue.main.async {
          self.detailView.mainImageView.image = image as? UIImage
        }
      }
    }
  }
}
  
