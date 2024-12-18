//
//  PermissionViewController.swift
//  Kingbus
//
//  Created by 이주성 on 12/19/24.
//

import UIKit

final class PermissionViewController: UIViewController {
    
    lazy var kingbusLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("kingbus.logo.splash")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 접근 권한을 허용해 주세요"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 20, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "킹버스 사용을 위해서는 앱 접근 권한이 필요합니다.\n허용한 정보는 마케팅 목적으로 사용되거나 제 3자에게 제공되지 않습니다."
        label.textColor = .useRGB(red: 148, green: 147, blue: 147)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var permissionBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var notificationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("notification.permission.icon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var notificationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "알림 [선택]"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.asFontColor(targetString: "[선택]", font: .useFont(ofSize: 14, weight: .Medium), color: .useRGB(red: 223, green: 52, blue: 52))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var notificationSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자 상황에 맞는 일정 및 견적 알림"
        label.textColor = .useRGB(red: 148, green: 147, blue: 147)
        label.font = .useFont(ofSize: 12, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var permissionCheckButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.useRGB(red: 255, green: 255, blue: 255, alpha: 0.5), for: .highlighted)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(permissionCheckButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        print("----------------------------------- PermissionViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension PermissionViewController: EssentialViewMethods {
    func setViewFoundation() {
        self.view.backgroundColor = .white
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
            self.kingbusLogoImageView,
            self.titleLabel,
            self.subTitleLabel,
            self.permissionBaseView,
            self.permissionCheckButton,
        ], to: self.view)
        
        SupportingMethods.shared.addSubviews([
            self.notificationIconImageView,
            self.notificationTitleLabel,
            self.notificationSubTitleLabel,
        ], to: self.permissionBaseView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // kingbusLogoImageView
        NSLayoutConstraint.activate([
            self.kingbusLogoImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.kingbusLogoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 131),
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.titleLabel.topAnchor.constraint(equalTo: self.kingbusLogoImageView.bottomAnchor, constant: 20),
        ])
        
        // subTitleLabel
        NSLayoutConstraint.activate([
            self.subTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4),
        ])
        
        // permissionBaseView
        NSLayoutConstraint.activate([
            self.permissionBaseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.permissionBaseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.permissionBaseView.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 20),
        ])
        
        // notificationIconImageView
        NSLayoutConstraint.activate([
            self.notificationIconImageView.leadingAnchor.constraint(equalTo: self.permissionBaseView.leadingAnchor, constant: 16),
            self.notificationIconImageView.topAnchor.constraint(equalTo: self.permissionBaseView.topAnchor, constant: 20),
            self.notificationIconImageView.heightAnchor.constraint(equalToConstant: 24),
            self.notificationIconImageView.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        // notificationTitleLabel
        NSLayoutConstraint.activate([
            self.notificationTitleLabel.leadingAnchor.constraint(equalTo: self.notificationIconImageView.trailingAnchor, constant: 8),
            self.notificationTitleLabel.centerYAnchor.constraint(equalTo: self.notificationIconImageView.centerYAnchor),
        ])
        
        // notificationSubTitleLabel
        NSLayoutConstraint.activate([
            self.notificationSubTitleLabel.leadingAnchor.constraint(equalTo: self.notificationTitleLabel.leadingAnchor),
            self.notificationSubTitleLabel.trailingAnchor.constraint(equalTo: self.permissionBaseView.trailingAnchor, constant: -20),
            self.notificationSubTitleLabel.topAnchor.constraint(equalTo: self.notificationTitleLabel.bottomAnchor, constant: 4),
            self.notificationSubTitleLabel.bottomAnchor.constraint(equalTo: self.permissionBaseView.bottomAnchor, constant: -20),
        ])
        
        // permissionCheckButton
        NSLayoutConstraint.activate([
            self.permissionCheckButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.permissionCheckButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.permissionCheckButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
            self.permissionCheckButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Extension for methods added
extension PermissionViewController {
    
}

// MARK: - Extension for selector methods
extension PermissionViewController {
    @objc func permissionCheckButton(_ sender: UIButton) {
        SupportingMethods.shared.requestNotificationPermission {
            DispatchQueue.main.async {
                self.dismiss(animated: true) {
                    ReferenceValues.isCheckPermission = true
                    
                }                
                
            }
            
        }
        
    }
    
}
