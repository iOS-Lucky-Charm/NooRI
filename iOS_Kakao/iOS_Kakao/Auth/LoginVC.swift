//
//  LoginVC.swift
//  iOS_Kakao
//
//  Created by 누리링 on 2023/02/23.
//

import UIKit
import SnapKit
import Then

class LoginVC: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private let subTitle = UILabel().then {
        $0.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해주세요"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .systemGray2
    }
    
    private let emailTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    // 정이꺼 쇽샥해오기
    private let emailLineField = UITextField().then {
        $0.backgroundColor = .systemGray3
    }
    
    private let passwordTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    private let passwordLineField = UITextField().then {
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.backgroundColor = .systemGray6
        $0.addTarget(self, action: #selector(clickLoginbutton), for: .touchUpInside)
    }
    
    private lazy var newloginButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.addTarget(self, action: #selector(clickNewLoginbutton), for: .touchUpInside)
    }
    
    private let bottomTitleLabel = UILabel().then {
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .systemGray
    }
    
    var result : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        LoginLayout()
    }
    
    private func presentToNewLoginVC() {
        let newloginVC = NewLoginVC()
        newloginVC.modalPresentationStyle = .formSheet
        self.present(newloginVC, animated: true, completion: nil)
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeVC()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let answer = emailTextField.text{
            welcomeVC.dataBind(result:answer)
        }
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    private func pushToNewLoginVC() {
        let newloginVC = NewLoginVC()
        self.navigationController?.pushViewController(newloginVC, animated: true)
    }
    
    @objc
    private func clickLoginbutton() {
        presentToWelcomeVC()
    }
    
    @objc
    private func clickNewLoginbutton() {
        pushToNewLoginVC()
    }
}

extension LoginVC {
    
    private func LoginLayout() {
        [titleLabel, subTitle, emailTextField, passwordTextField, loginButton, newloginButton, bottomTitleLabel, emailLineField, passwordLineField].forEach{view.addSubview($0)}
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        subTitle.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(self.subTitle.snp.bottom).offset(60)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(49)
        }
        
        emailLineField.snp.makeConstraints{
            $0.top.equalTo(self.emailTextField.snp.bottom)
            $0.leading.equalTo(self.emailTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(49)
        }
        
        passwordLineField.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField.snp.bottom)
            $0.leading.equalTo(self.emailTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(1)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(44)
        }
        
        newloginButton.snp.makeConstraints{
            $0.top.equalTo(self.loginButton.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(44)
        }
        
        bottomTitleLabel.snp.makeConstraints{
            $0.top.equalTo(self.newloginButton.snp.bottom).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(29)
        }
    }
}
