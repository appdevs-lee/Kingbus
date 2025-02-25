//
//  LoginViewController.swift
//  Kingbus
//
//  Created by 이주성 on 12/14/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("loginMainImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "쉽고 빠른 견적\n버스대절은 킹버스"
        label.textColor = .white
        label.font = .useFont(ofSize: 24, weight: .Regular)
        label.numberOfLines = 2
        label.asFontColor(targetString: "버스대절은 킹버스", font: .useFont(ofSize: 24, weight: .ExtraBold), color: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var buttonBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .highlighted)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .selected)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var noLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 없이 이용", for: .normal)
        button.setTitleColor(.useRGB(red: 46, green: 45, blue: 45), for: .normal)
        button.setTitleColor(.useRGB(red: 46, green: 45, blue: 45, alpha: 0.5), for: .highlighted)
        button.titleLabel?.font = .useFont(ofSize: 14, weight: .Medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setDelegates()
        self.setGestures()
        self.setNotificationCenters()
        self.setSubviews()
        self.setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    deinit {
        print("----------------------------------- LoginViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension LoginViewController: EssentialViewMethods {
    func setViewFoundation() {
        ReferenceValues.firstVC = self
        // Pop Slide
        if self.navigationController?.viewControllers.first === self  {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
        
    }
    
    func initializeObjects() {
        
    }
    
    func setDelegates() {
        
    }
    
    func setGestures() {
        
    }
    
    func setNotificationCenters() {
        
    }
    
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.mainImageView,
            self.titleLabel,
            self.buttonBaseView,
        ], to: self.view)
        
        SupportingMethods.shared.addSubviews([
            self.loginButton,
            self.noLoginButton,
        ], to: self.buttonBaseView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // mainImageView
        NSLayoutConstraint.activate([
            self.mainImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.mainImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.mainImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.mainImageView.bottomAnchor.constraint(equalTo: self.buttonBaseView.topAnchor),
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.mainImageView.leadingAnchor, constant: 20),
            self.titleLabel.topAnchor.constraint(equalTo: self.mainImageView.topAnchor, constant: 151),
        ])
        
        // buttonBaseView
        NSLayoutConstraint.activate([
            self.buttonBaseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.buttonBaseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.buttonBaseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.buttonBaseView.heightAnchor.constraint(greaterThanOrEqualToConstant: 190),
        ])
        
        // loginButton
        NSLayoutConstraint.activate([
            self.loginButton.leadingAnchor.constraint(equalTo: self.buttonBaseView.leadingAnchor, constant: 20),
            self.loginButton.trailingAnchor.constraint(equalTo: self.buttonBaseView.trailingAnchor, constant: -20),
            self.loginButton.topAnchor.constraint(equalTo: self.buttonBaseView.topAnchor, constant: 34),
            self.loginButton.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        // noLoginButton
        NSLayoutConstraint.activate([
            self.noLoginButton.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            self.noLoginButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 12),
            self.noLoginButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Extension for methods added
extension LoginViewController {
    
}

// MARK: - Extension for selector methods
extension LoginViewController {
    @objc func loginButton(_ sender: UIButton) {
        let vc = RegisterUserInfoViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - Extension for UIGestureRecognizerDelegate
extension LoginViewController: UIGestureRecognizerDelegate {
    // For swipe gesture
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // For swipe gesture, prevent working on the root view of navigation controller
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.navigationController!.viewControllers.count > 1 ? true : false
    }
    
}
