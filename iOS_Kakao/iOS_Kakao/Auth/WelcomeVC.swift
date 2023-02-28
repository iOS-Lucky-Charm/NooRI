//
//  WelcomeVC.swift
//  iOS_Kakao
//
//  Created by 누리링 on 2023/02/23.
//

import UIKit
import Then

class WelcomeVC: UIViewController {
    
    private let resultLabel = UILabel().then {
        $0.text = "000님\n환영합니다"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemYellow
        $0.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
    }
    
    private func presentFriendListVC() {
        let friendListVC = FriendsListVC()
        friendListVC.modalPresentationStyle = .fullScreen
        let sceneDeligate = UIApplication.shared.connectedScenes.first?.delegate
        as!SceneDelegate
        sceneDeligate.window?.rootViewController = UINavigationController(rootViewController: friendListVC)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        WelcomeLayout()
    }
    
    func dataBind(result:String){
        resultLabel.text = "\(result)님\n환영합니다"
    }
    @objc
    private func touchupBackButton(){
        presentFriendListVC()
    }

}

extension WelcomeVC {
    
    private func WelcomeLayout(){
        [resultLabel, backButton].forEach{view.addSubview($0)
        }
        
        resultLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
        }
        
        backButton.snp.makeConstraints{ make in
            make.top.equalTo(self.resultLabel.snp.bottom).offset(117)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
        
    }
}
