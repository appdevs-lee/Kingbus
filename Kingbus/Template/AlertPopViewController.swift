//
//  AlertPopViewController.swift
//  UniversalBora
//
//  Created by 이주성 on 7/2/24.
//
import UIKit

enum AlertPopViewType {
    case normalOneButton(messageTitle: String?, messageContent: String?, buttonTitle: String, action:(() -> ())?)
    case normalTwoButton(messageTitle: String?, messageContent: String?, leftButtonTitle: String, leftAction: (() -> ())?, rightButtonTitle: String, rightAction: (() -> ())?)
}

final class AlertPopViewController: UIViewController {
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .useRGB(red: 0, green: 0, blue: 0, alpha: 0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var panelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
//        view.layer.useSketchShadow(color: .black, alpha: 0.15, x: 0, y: 8, blur: 16, spread: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var alertImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("alertPopIcon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .useFont(ofSize: 18, weight: .Bold)
        label.textAlignment = .center
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .useRGB(red: 101, green: 100, blue: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        button.layer.cornerRadius = 8
        button.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.addTarget(self, action: #selector(leftButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.addTarget(self, action: #selector(rightButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let alertPopViewType: AlertPopViewType
    let orientation: UIInterfaceOrientationMask
    let willDismissAfterAction: Bool
    
    init(_ alertPopViewType: AlertPopViewType,
         orientation: UIInterfaceOrientationMask = .portrait,
         preferredOrientation: UIInterfaceOrientation = .portrait, willDismissAfterAction: Bool = true) {
        self.alertPopViewType = alertPopViewType
        self.orientation = orientation
        self.willDismissAfterAction = willDismissAfterAction
        
        super.init(nibName: nil, bundle: nil)
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
        
        switch self.alertPopViewType {
        case .normalOneButton(let messageTitle, let messageContnet, let buttonTitle, _):
            self.titleLabel.text = messageTitle
            self.contentLabel.text = messageContnet
            self.rightButton.setTitle(buttonTitle, for: .normal)
            
        case .normalTwoButton(let messageTitle, let messageContent, let leftButtonTitle, _, let rightButtonTitle, _):
            self.titleLabel.text = messageTitle
            self.contentLabel.text = messageContent
            self.leftButton.setTitle(leftButtonTitle, for: .normal)
            self.rightButton.setTitle(rightButtonTitle, for: .normal)
        }
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
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.orientation
    }
    
    deinit {
            print("----------------------------------- AlertPopViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension AlertPopViewController: EssentialViewMethods {
    func setViewFoundation() {
        self.view.backgroundColor = .clear
        self.view.isOpaque = false
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
            self.baseView
        ], to: self.view)
        
        switch self.alertPopViewType {
        case .normalOneButton:
            SupportingMethods.shared.addSubviews([
                self.panelView
            ], to: self.baseView)
            
            SupportingMethods.shared.addSubviews([
                self.centerView,
                self.rightButton
            ], to: self.panelView)
            
            SupportingMethods.shared.addSubviews([
                self.alertImageView,
                self.titleLabel,
                self.contentLabel
            ], to: self.centerView)
            
        case .normalTwoButton:
            SupportingMethods.shared.addSubviews([
                self.panelView
            ], to: self.baseView)
            
            SupportingMethods.shared.addSubviews([
                self.centerView,
                self.leftButton,
                self.rightButton
            ], to: self.panelView)
            
            SupportingMethods.shared.addSubviews([
                self.alertImageView,
                self.titleLabel,
                self.contentLabel
            ], to: self.centerView)
        }
    }
    
    func setLayouts() {
        // baseView
        NSLayoutConstraint.activate([
            self.baseView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.baseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.baseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.baseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        switch self.alertPopViewType {
        case .normalOneButton:
            // panelView
            NSLayoutConstraint.activate([
                self.panelView.centerYAnchor.constraint(equalTo: self.baseView.centerYAnchor),
                self.panelView.heightAnchor.constraint(equalToConstant: 230),
                self.panelView.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
                self.panelView.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            ])
            
            // centerView
            NSLayoutConstraint.activate([
                self.centerView.topAnchor.constraint(equalTo: self.panelView.topAnchor, constant: 20),
                self.centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 126),
                self.centerView.leadingAnchor.constraint(equalTo: self.panelView.leadingAnchor, constant: 24),
                self.centerView.trailingAnchor.constraint(equalTo: self.panelView.trailingAnchor, constant: -24),
            ])
            
            // alertImageView
            NSLayoutConstraint.activate([
                self.alertImageView.centerXAnchor.constraint(equalTo: self.centerView.centerXAnchor),
                self.alertImageView.topAnchor.constraint(equalTo: self.centerView.topAnchor),
                self.alertImageView.heightAnchor.constraint(equalToConstant: 44),
                self.alertImageView.widthAnchor.constraint(equalToConstant: 44),
            ])
            
            // titleLabel
            NSLayoutConstraint.activate([
                self.titleLabel.topAnchor.constraint(equalTo: self.alertImageView.bottomAnchor, constant: 8),
                self.titleLabel.heightAnchor.constraint(equalToConstant: 21),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor)
            ])
            
            // contentLabel
            NSLayoutConstraint.activate([
                self.contentLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
                self.contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19),
                self.contentLabel.bottomAnchor.constraint(equalTo: self.centerView.bottomAnchor),
                self.contentLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor),
                self.contentLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor)
            ])
            
            // rightButton
            NSLayoutConstraint.activate([
                self.rightButton.bottomAnchor.constraint(equalTo: self.panelView.bottomAnchor, constant: -20),
                self.rightButton.heightAnchor.constraint(equalToConstant: 52),
                self.rightButton.leadingAnchor.constraint(equalTo: self.panelView.leadingAnchor, constant: 24),
                self.rightButton.trailingAnchor.constraint(equalTo: self.panelView.trailingAnchor, constant: -24)
            ])
            
        case .normalTwoButton:
            // panelView
            // panelView
            NSLayoutConstraint.activate([
                self.panelView.centerYAnchor.constraint(equalTo: self.baseView.centerYAnchor),
                self.panelView.heightAnchor.constraint(equalToConstant: 230),
                self.panelView.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
                self.panelView.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            ])
            
            // centerView
            NSLayoutConstraint.activate([
                self.centerView.topAnchor.constraint(equalTo: self.panelView.topAnchor, constant: 20),
                self.centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 126),
                self.centerView.leadingAnchor.constraint(equalTo: self.panelView.leadingAnchor, constant: 24),
                self.centerView.trailingAnchor.constraint(equalTo: self.panelView.trailingAnchor, constant: -24),
            ])
            
            // alertImageView
            NSLayoutConstraint.activate([
                self.alertImageView.centerXAnchor.constraint(equalTo: self.centerView.centerXAnchor),
                self.alertImageView.topAnchor.constraint(equalTo: self.centerView.topAnchor),
                self.alertImageView.heightAnchor.constraint(equalToConstant: 44),
                self.alertImageView.widthAnchor.constraint(equalToConstant: 44),
            ])
            
            // titleLabel
            NSLayoutConstraint.activate([
                self.titleLabel.topAnchor.constraint(equalTo: self.alertImageView.bottomAnchor, constant: 8),
                self.titleLabel.heightAnchor.constraint(equalToConstant: 21),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor)
            ])
            
            // contentLabel
            NSLayoutConstraint.activate([
                self.contentLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
                self.contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19),
                self.contentLabel.bottomAnchor.constraint(equalTo: self.centerView.bottomAnchor),
                self.contentLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor),
                self.contentLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor)
            ])
            
            // leftButton
            NSLayoutConstraint.activate([
                self.leftButton.bottomAnchor.constraint(equalTo: self.panelView.bottomAnchor, constant: -20),
                self.leftButton.heightAnchor.constraint(equalToConstant: 52),
                self.leftButton.leadingAnchor.constraint(equalTo: self.panelView.leadingAnchor, constant: 24),
                self.leftButton.trailingAnchor.constraint(equalTo: self.panelView.centerXAnchor, constant: -6)
            ])
            
            // rightButton
            NSLayoutConstraint.activate([
                self.rightButton.bottomAnchor.constraint(equalTo: self.panelView.bottomAnchor, constant: -20),
                self.rightButton.heightAnchor.constraint(equalToConstant: 52),
                self.rightButton.leadingAnchor.constraint(equalTo: self.panelView.centerXAnchor, constant: 6),
                self.rightButton.trailingAnchor.constraint(equalTo: self.panelView.trailingAnchor, constant: -24)
            ])
        }
    }
    
    func setViewAfterTransition() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - Extension for methods added
extension AlertPopViewController {
    
}

// MARK: - Extension for selector methods
extension AlertPopViewController {
    @objc func leftButton(_ sender: UIButton) {
        if self.willDismissAfterAction {
            self.dismiss(animated: false) {
                switch self.alertPopViewType {
                case .normalOneButton:
                    print("not happen")
                    
                case .normalTwoButton(_, _, _, let leftAction, _, _):
                    leftAction?()
                }
            }
            
        } else {
            switch self.alertPopViewType {
            case .normalOneButton:
                print("not happen")
                
            case .normalTwoButton(_, _, _, let leftAction, _, _):
                leftAction?()
            }
        }
    }
    
    @objc func rightButton(_ sender: UIButton) {
        if self.willDismissAfterAction {
            self.dismiss(animated: false) {
                switch self.alertPopViewType {
                case .normalOneButton(_, _, _, let action):
                    action?()
                    
                case .normalTwoButton(_, _, _, _, _, let rightAction):
                    rightAction?()
                }
            }
            
        } else {
            switch self.alertPopViewType {
            case .normalOneButton(_, _, _, let action):
                action?()
                
            case .normalTwoButton(_, _, _, _, _, let rightAction):
                rightAction?()
            }
        }
    }
}
