//
//  RegisterUserInfoViewController.swift
//  Kingbus
//
//  Created by 이주성 on 12/14/24.
//

import UIKit

final class RegisterUserInfoViewController: UIViewController {
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 정보를 입력해 주세요"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 24, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.borderStyle = .none
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.setPlaceholder(placeholder: "이름을 입력해 주세요")
        textField.addLeftPadding()
        textField.layer.cornerRadius = 8
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var phoneNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.borderStyle = .none
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.setPlaceholder(placeholder: "전화번호를 입력해 주세요(-없이 입력)")
        textField.addLeftPadding()
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var authenticationRequestButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("인증 요청", for: .normal)
        button.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .highlighted)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .selected)
        button.titleLabel?.font = .useFont(ofSize: 11, weight: .Medium)
        button.backgroundColor = .useRGB(red: 219, green: 219, blue: 219)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(authenticationRequestButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var authenticationBaseView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var authenticationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "03:00"
        label.textColor = .useRGB(red: 223, green: 52, blue: 52)
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var authenticationTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.borderStyle = .none
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.setPlaceholder(placeholder: "인증번호를 입력해 주세요")
        textField.addLeftPadding()
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.useRGB(red: 223, green: 52, blue: 52).cgColor
        textField.layer.borderWidth = 0.0
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var authenticationCheckButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.isEnabled = false
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .highlighted)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .selected)
        button.titleLabel?.font = .useFont(ofSize: 11, weight: .Medium)
        button.backgroundColor = .useRGB(red: 219, green: 219, blue: 219)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(authenticationCheckButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var authenticationDoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = .useCustomImage("authentication.done")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var alertAndGuideStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authenticationAlertStackView, self.guideLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authenticationAlertStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authenticationImageView, self.authenticationAlertLabel])
        stackView.isHidden = true
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authenticationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("authenication.alert")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var authenticationAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호가 일치하지 않습니다"
        label.textColor = .useRGB(red: 223, green: 52, blue: 52)
        label.font = .useFont(ofSize: 12, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.text = "타인에게 공유하지 마세요!\n인증번호가 오지 않는다면 1522-9821로 문의 주세요"
        label.textColor = .useRGB(red: 148, green: 147, blue: 147)
        label.font = .useFont(ofSize: 12, weight: .Regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var completeRegisterButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .highlighted)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
        button.addTarget(self, action: #selector(completeRegisterButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let loginModel = LoginModel()
    
    var timer: Timer?
    var timerNum: Int = 0
    
    var baseViewTopAnchorConstraint: NSLayoutConstraint!
    var completeRegisterButtonBottomAnchorConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setDelegates()
        self.setGestures()
        self.setNotificationCenters()
        self.setSubviews()
        self.setLayouts()
        self.setUpNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    deinit {
        print("----------------------------------- RegisterUserInfoViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension RegisterUserInfoViewController: EssentialViewMethods {
    func setViewFoundation() {
        
    }
    
    func initializeObjects() {
        
    }
    
    func setDelegates() {
        
    }
    
    func setGestures() {
        
    }
    
    func setNotificationCenters() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.baseView,
        ], to: self.view)
        
        SupportingMethods.shared.addSubviews([
            self.titleLabel,
            self.nameTitleLabel,
            self.nameTextField,
            self.phoneNumberTitleLabel,
            self.phoneNumberTextField,
            self.authenticationRequestButton,
            self.authenticationBaseView,
            self.authenticationCheckButton,
            self.authenticationDoneImageView,
            self.completeRegisterButton,
        ], to: self.baseView)
        
        SupportingMethods.shared.addSubviews([
            self.authenticationTitleLabel,
            self.timerLabel,
            self.authenticationTextField,
            self.alertAndGuideStackView,
        ], to: self.authenticationBaseView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // baseView
        self.baseViewTopAnchorConstraint = self.baseView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        NSLayoutConstraint.activate([
            self.baseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.baseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.baseViewTopAnchorConstraint,
            self.baseView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            self.titleLabel.topAnchor.constraint(equalTo: self.baseView.topAnchor, constant: 44),
        ])
        
        // nameTitleLabel
        NSLayoutConstraint.activate([
            self.nameTitleLabel.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.nameTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 68),
        ])
        
        // nameTextField
        NSLayoutConstraint.activate([
            self.nameTextField.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            self.nameTextField.topAnchor.constraint(equalTo: self.nameTitleLabel.bottomAnchor, constant: 8),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // phoneNumberTitleLabel
        NSLayoutConstraint.activate([
            self.phoneNumberTitleLabel.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.phoneNumberTitleLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 16),
        ])
        
        // phoneNumberTextField
        NSLayoutConstraint.activate([
            self.phoneNumberTextField.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.phoneNumberTextField.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            self.phoneNumberTextField.topAnchor.constraint(equalTo: self.phoneNumberTitleLabel.bottomAnchor, constant: 8),
            self.phoneNumberTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // authenticationRequestButton
        NSLayoutConstraint.activate([
            self.authenticationRequestButton.trailingAnchor.constraint(equalTo: self.phoneNumberTextField.trailingAnchor, constant: -12),
            self.authenticationRequestButton.centerYAnchor.constraint(equalTo: self.phoneNumberTextField.centerYAnchor),
            self.authenticationRequestButton.heightAnchor.constraint(equalToConstant: 22),
            self.authenticationRequestButton.widthAnchor.constraint(equalToConstant: 57),
        ])
        
        // authenticationBaseView
        NSLayoutConstraint.activate([
            self.authenticationBaseView.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.authenticationBaseView.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            self.authenticationBaseView.topAnchor.constraint(equalTo: self.phoneNumberTextField.bottomAnchor, constant: 16),
        ])
        
        // authenticationTitleLabel
        NSLayoutConstraint.activate([
            self.authenticationTitleLabel.leadingAnchor.constraint(equalTo: self.authenticationBaseView.leadingAnchor),
            self.authenticationTitleLabel.topAnchor.constraint(equalTo: self.authenticationBaseView.topAnchor),
        ])
        
        // timerLabel
        NSLayoutConstraint.activate([
            self.timerLabel.trailingAnchor.constraint(equalTo: self.authenticationBaseView.trailingAnchor, constant: -20),
            self.timerLabel.centerYAnchor.constraint(equalTo: self.authenticationTitleLabel.centerYAnchor),
        ])
        
        // authenticationTextField
        NSLayoutConstraint.activate([
            self.authenticationTextField.leadingAnchor.constraint(equalTo: self.authenticationBaseView.leadingAnchor),
            self.authenticationTextField.trailingAnchor.constraint(equalTo: self.authenticationBaseView.trailingAnchor),
            self.authenticationTextField.topAnchor.constraint(equalTo: self.authenticationTitleLabel.bottomAnchor, constant: 8),
            self.authenticationTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // authenticationCheckButton
        NSLayoutConstraint.activate([
            self.authenticationCheckButton.trailingAnchor.constraint(equalTo: self.authenticationTextField.trailingAnchor, constant: -12),
            self.authenticationCheckButton.centerYAnchor.constraint(equalTo: self.authenticationTextField.centerYAnchor),
            self.authenticationCheckButton.heightAnchor.constraint(equalToConstant: 22),
            self.authenticationCheckButton.widthAnchor.constraint(equalToConstant: 57),
        ])
        
        // authenticationDoneImageView
        NSLayoutConstraint.activate([
            self.authenticationDoneImageView.trailingAnchor.constraint(equalTo: self.authenticationTextField.trailingAnchor, constant: -12),
            self.authenticationDoneImageView.centerYAnchor.constraint(equalTo: self.authenticationTextField.centerYAnchor),
            self.authenticationDoneImageView.heightAnchor.constraint(equalToConstant: 20),
            self.authenticationDoneImageView.widthAnchor.constraint(equalToConstant: 20),
        ])
        
        // alertAndGuideStackView
        NSLayoutConstraint.activate([
            self.alertAndGuideStackView.leadingAnchor.constraint(equalTo: self.authenticationBaseView.leadingAnchor),
            self.alertAndGuideStackView.trailingAnchor.constraint(equalTo: self.authenticationBaseView.trailingAnchor),
            self.alertAndGuideStackView.topAnchor.constraint(equalTo: self.authenticationTextField.bottomAnchor, constant: 8),
        ])
        
        // authenticationImageView
        NSLayoutConstraint.activate([
            self.authenticationImageView.heightAnchor.constraint(equalToConstant: 16),
            self.authenticationImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
        
        // completeRegisterButton
        self.completeRegisterButtonBottomAnchorConstraint = self.completeRegisterButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            self.completeRegisterButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.completeRegisterButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.completeRegisterButtonBottomAnchorConstraint,
            self.completeRegisterButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func setUpNavigationItem() {
        self.view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white // Navigation bar is transparent and root view appears on it.
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor.useRGB(red: 46, green: 45, blue: 45),
            .font:UIFont.useFont(ofSize: 16, weight: .Bold)
        ]
        
        // MARK: NavigationItem appearance for each view controller
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        
        self.navigationItem.title = "로그인"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBarButtonItem(_:)))
    }
}

// MARK: - Extension for methods added
extension RegisterUserInfoViewController {
    func startTimer() {
        self.timerNum = 180
        
        //기존에 타이머 동작중이면 중지 처리
        if self.timer != nil && self.timer!.isValid {
            self.timer!.invalidate()
        }
        
        //1초 간격 타이머 시작
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    // MARK: API
    func sendCodeDataRequest(phoneNumber: String, success: (() -> ())?) {
        self.loginModel.sendCodeDataRequest(phoneNumber: phoneNumber) {
            success?()
            
        } failure: { message in
            SupportingMethods.shared.checkExpiration {
                print("sendCodeDataRequest API Error: \(message)")
                SupportingMethods.shared.turnCoverView(.off)
                
            }
        }

    }
    
    func verifyCodeDataRequest(phoneNumber: String, code: Int, success: ((Bool) -> ())?) {
        self.loginModel.verifyCodeDataRequest(phoneNumber: phoneNumber, code: code) { isSame in
            success?(isSame)
            
        } failure: { message in
            SupportingMethods.shared.checkExpiration {
                print("verifyCodeDataRequest API Error: \(message)")
                SupportingMethods.shared.turnCoverView(.off)
                
            }
        }

        
    }
    
    func loginUserDataRequest(name: String, phoneNumber: String, success: (() -> ())?) {
        self.loginModel.loginUserDataRequest(name: name, phoneNumber: phoneNumber) { _ in
            success?()
            
        } failure: { message in
            SupportingMethods.shared.checkExpiration {
                print("loginUserDataRequest API Error: \(message)")
                SupportingMethods.shared.turnCoverView(.off)
                
            }
            
        }

    }
    
}

// MARK: - Extension for selector methods
extension RegisterUserInfoViewController {
    @objc func leftBarButtonItem(_ barButtonItem: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func authenticationRequestButton(_ sender: UIButton) {
        // FIXME: 인증번호 요청 API
        self.sendCodeDataRequest(phoneNumber: self.phoneNumberTextField.text!) {
            if self.timerNum < 170 {
                print("authenticationRequestButton")
                self.authenticationRequestButton.setTitle("재요청", for: .normal)
                
                self.authenticationBaseView.isHidden = false
                
                self.authenticationAlertStackView.isHidden = true
                self.authenticationTextField.layer.borderWidth = 0.0
                
                self.authenticationDoneImageView.isHidden = true
                self.authenticationCheckButton.isHidden = false
                
                self.authenticationTextField.becomeFirstResponder()
                self.startTimer()
                
            }
            
        }

    }
    
    @objc func authenticationCheckButton(_ sender: UIButton) {
        print("authenticationCheckButton")
        let validNumber = "123456"
        self.verifyCodeDataRequest(phoneNumber: self.phoneNumberTextField.text!, code: Int(self.authenticationTextField.text!)!) { isSame in
            if isSame {
                // 인증번호 일치
                self.authenticationAlertStackView.isHidden = true
                self.authenticationTextField.layer.borderWidth = 0.0
                
                self.authenticationDoneImageView.isHidden = false
                self.authenticationCheckButton.isHidden = true
                
                self.completeRegisterButton.isHidden = false
                
            } else {
                // 인증번호 불일치
                self.authenticationAlertStackView.isHidden = false
                self.authenticationTextField.layer.borderWidth = 1.0
                
                self.authenticationDoneImageView.isHidden = true
                self.authenticationCheckButton.isHidden = false
                
                self.completeRegisterButton.isHidden = true
            }
            
        }
        
    }
    
    @objc func completeRegisterButton(_ sender: UIButton) {
        self.loginUserDataRequest(name: self.nameTextField.text!, phoneNumber: self.phoneNumberTextField.text!) {
            let vc = CustomizedTabBarController()
            
            self.present(vc, animated: false)
            
        }
        
    }
    
    @objc func timerCallback() {
        let minute = self.timerNum % 3600 / 60
        let second = self.timerNum % 3600 % 60 % 60
        self.timerLabel.text = "\(minute < 10 ? "0\(minute)" : "\(minute)"):\(second < 10 ? "0\(second)" : "\(second)")"
        
        //timerNum이 0이면(60초 경과) 타이머 종료
        if(self.timerNum == 0) {
            self.timer?.invalidate()
            self.timer = nil
            
            //타이머 종료 후 처리...
            self.timerNum = 0
            
        }
     
        //timerNum -1 감소시키기
        self.timerNum -= 1
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let _ = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.transition(with: self.view, duration: 1.0) {
                if self.baseViewTopAnchorConstraint.constant == 0 {
                    if self.authenticationTextField.isEditing && self.authenticationTextField.text == "" {
                        self.baseViewTopAnchorConstraint.constant -= 112
                        
                        self.view.layoutIfNeeded()
                        
                    }
                    
                }
                
            }
            
            self.completeRegisterButtonBottomAnchorConstraint.constant = -keyboardSize.height
            
            
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.animate(withDuration: duration) {
                self.baseViewTopAnchorConstraint.constant = 0
                
                self.view.layoutIfNeeded()
                
            } completion: { finished in
                
            }
        }
    }
    
}

// MARK: - Extension for UITextFieldDelegate
extension RegisterUserInfoViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 백스페이스 실행가능하게 하게하기
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                return true
            }
        }
        // 자리수 제한
        if textField == self.phoneNumberTextField {
            if self.phoneNumberTextField.text!.count < 11 {
                return true
                
            } else {
                return false
                
            }
            
        } else if textField == self.authenticationTextField {
            if self.authenticationTextField.text!.count < 4 {
                return true
                
            } else {
                return false
                
            }
            
        }
            
        return true
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if self.nameTextField.text != "" && self.phoneNumberTextField.text != "" {
            if SupportingMethods.shared.isValidPhoneNumber(self.phoneNumberTextField.text!) {
                self.authenticationRequestButton.isEnabled = true
                self.authenticationRequestButton.setTitleColor(.white, for: .normal)
                self.authenticationRequestButton.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
                
            } else {
                self.authenticationRequestButton.isEnabled = false
                self.authenticationRequestButton.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
                self.authenticationRequestButton.backgroundColor = .useRGB(red: 219, green: 219, blue: 219)
                
            }
            
        } else {
            self.authenticationRequestButton.isEnabled = false
            self.authenticationRequestButton.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
            self.authenticationRequestButton.backgroundColor = .useRGB(red: 219, green: 219, blue: 219)
        }
        
        if self.authenticationTextField.text != "" {
            self.authenticationCheckButton.isEnabled = true
            self.authenticationCheckButton.setTitleColor(.white, for: .normal)
            self.authenticationCheckButton.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
            
        } else {
            self.authenticationCheckButton.isEnabled = false
            self.authenticationCheckButton.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
            self.authenticationCheckButton.backgroundColor = .useRGB(red: 219, green: 219, blue: 219)
            
        }
        
        // 뭔가 변경 시에 무조건 재인증
        self.completeRegisterButton.isHidden = true
        
    }
    
}
