//
//  NewLoginVC.swift
//  iOS_Kakao
//
//  Created by 누리링 on 2023/02/23.
//

import UIKit
import Then


class NewLoginVC: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let emailTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "이메일 또는 전화번호"
    }
    
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
    
    private let passwordTextField2 = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "비밀번호 확인"
        $0.isSecureTextEntry = true
    }
    
    private let passwordLineField2 = UITextField().then {
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var newloginButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.addTarget(self, action: #selector(touchupWelcomeButton), for:.touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        NewLayout()
    }
    
    private func presentToWelcomeVC(){
        let welcomeVC = WelcomeVC()
        welcomeVC.modalPresentationStyle = .formSheet
        if let answer = emailTextField.text{
            welcomeVC.dataBind(result: answer)
        }
        
        self.present(welcomeVC, animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
        
    }
    
    @objc
    private func touchupWelcomeButton(){
        presentToWelcomeVC()
    }
}

extension NewLoginVC{
    
    private func NewLayout(){
        [titleLabel, emailTextField, passwordTextField, passwordTextField2, emailLineField, passwordLineField, passwordLineField2, newloginButton].forEach(view.addSubview(_:))
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel).offset(119)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            $0.width.equalTo(333)
            $0.height.equalTo(49)
        }
        
        emailLineField.snp.makeConstraints{
            $0.top.equalTo(self.emailTextField.snp.bottom)
            $0.leading.equalTo(self.emailTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(self.emailLineField).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            $0.width.equalTo(333)
            $0.height.equalTo(49)
        }
        
        passwordLineField.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField.snp.bottom)
            $0.leading.equalTo(self.passwordTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(1)
        }
        
        passwordTextField2.snp.makeConstraints{
            $0.top.equalTo(self.passwordLineField).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            $0.width.equalTo(333)
            $0.height.equalTo(49)
        }
        
        passwordLineField2.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField2.snp.bottom)
            $0.leading.equalTo(self.passwordTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(1)
        }
        
        newloginButton.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField2.snp.bottom).offset(40)
            $0.leading.equalTo(self.emailTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(44)
        }
    }
    

}
