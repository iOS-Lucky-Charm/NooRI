//
//  FriendsListVC.swift
//  iOS_Kakao
//
//  Created by 누리링 on 2023/02/26.
//

import UIKit
import SnapKit
import Then

class FriendsListVC: UIViewController {
    
    private let topView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 23)
    }
    
    private let settingButton = UIImageView().then {
        $0.image = UIImage(named: "setting")
    }
    
    lazy var profileButton = UIButton().then {
        $0.addTarget(self, action: #selector(clickProfileButton), for: .touchUpInside)
        $0.setImage(UIImage(named: "profile_userImg"), for: .normal)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()

    }

    private func showMyProfileVC(){
        let profileVC = MyProfileVC()
        profileVC.modalPresentationStyle = .fullScreen

        self.present(profileVC, animated: true, completion: nil)
    }
    
    @objc
    private func clickProfileButton(){
        showMyProfileVC()
    }

}

extension FriendsListVC{
    
    private func setLayout() {
        
        [topView, profileButton].forEach(view.addSubview(_:))
        
        [friendLabel, settingButton].forEach(topView.addSubview(_:))
        
        
        topView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            $0.width.equalTo(375)
            $0.height.equalTo(52)
        }
        

        friendLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        settingButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalTo(self.friendLabel.snp.trailing).offset(5)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        
        profileButton.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
    }
}
