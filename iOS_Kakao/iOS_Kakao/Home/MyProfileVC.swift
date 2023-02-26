//
//  MyProfileVC.swift
//  iOS_Kakao
//
//  Created by 누리링 on 2023/02/26.
//

import UIKit
import SnapKit
import Then

class MyProfileVC: UIViewController {
    
    lazy var returnButton = UIButton().then {
        $0.setImage(UIImage(named: "xmark"), for: .normal)
        $0.addTarget(self, action: #selector(closeButton), for: .touchUpInside)
    }
    
    private var stackView = UIStackView().then {
        $0.backgroundColor = .clear
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 4
    }
    
    private let myProfile = UIImageView()
    private let myName = UILabel()
    private let divider = UILabel()
    
    private var bottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var chattingButton = UIButton().then {
        $0.addTarget(self, action: #selector(chattingAction), for: .touchUpInside)
    }
    
    private lazy var editButton = UIButton().then {
        $0.addTarget(self, action: #selector(editing), for: .touchUpInside)
    }
    
    private lazy var kakaoStoryButton = UIButton().then {
        $0.addTarget(self, action: #selector(kakaoStory), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        myProfileLayout()
    }
    
    @objc
    private func closeButton() {
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc
    private func chattingAction() {
        print("tap chatting")
    }
    
    @objc
    private func editing() {
        print("tap editing")
    }
    
    @objc
    private func kakaoStory() {
        print("tap kakaoStory")
    }
    
    func dataBind(result:String){
        myName.text = "\(result)"
    }
}

extension MyProfileVC{
    
    private func myProfileLayout() {
        
        [returnButton, stackView, divider, bottomStackView].forEach {
              view.addSubview($0)
          }
          
          [myProfile, myName].forEach {
              stackView.addArrangedSubview($0)
          }
          
          [chattingButton, editButton, kakaoStoryButton].forEach {
              bottomStackView.addArrangedSubview($0)
          }
          
          returnButton.snp.makeConstraints {
              $0.leading.equalTo(view.layoutMarginsGuide)
              $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
              $0.width.equalTo(14)
              $0.height.equalTo(14)
          }
          
          stackView.snp.makeConstraints {
              $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-300)
              $0.centerX.equalToSuperview()
              $0.width.equalTo(97)
              $0.height.equalTo(180)
          }
          
          divider.snp.makeConstraints {
              $0.top.equalTo(stackView.snp.bottom).offset(21)
              $0.leading.trailing.equalToSuperview()
              $0.height.equalTo(1)
          }
          
          bottomStackView.snp.makeConstraints {
              $0.top.equalTo(divider.snp.bottom).offset(33)
              $0.leading.trailing.equalToSuperview().inset(55)
              $0.height.equalTo(40)
          }
    }
    
    func config() {
        view.backgroundColor = .gray
        
        returnButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        returnButton.tintColor = .white
        
        myProfile.image = UIImage(named: "profile_userImg")
        
        myName.textColor = .white
        myName.textAlignment = .center
        myName.font = .systemFont(ofSize: 18, weight: .medium)
        
        divider.backgroundColor = .white
        
        chattingButton.setImage(UIImage(named: "profileTalkImg"), for: .normal)
        chattingButton.setTitle("나와의 채팅", for: .normal)
        chattingButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        chattingButton.alignTextBelow(spacing: 3)
        
        editButton.setImage(UIImage(named: "writeImg"), for: .normal)
        editButton.setTitle("프로필 편집", for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        editButton.alignTextBelow(spacing: 3)
        
        kakaoStoryButton.setImage(UIImage(named: "profileStoryImg"), for: .normal)
        kakaoStoryButton.setTitle("카카오스토리", for: .normal)
        kakaoStoryButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        kakaoStoryButton.alignTextBelow(spacing: 3)
    }
}


extension UIButton {
  
    func alignTextBelow(spacing: CGFloat = 4.0) {
            guard let image = self.imageView?.image else {
                return
            }

            guard let titleLabel = self.titleLabel else {
                return
            }

            guard let titleText = titleLabel.text else {
                return
            }

            let titleSize = titleText.size(withAttributes: [
                NSAttributedString.Key.font: titleLabel.font as Any
            ])

            titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
}
