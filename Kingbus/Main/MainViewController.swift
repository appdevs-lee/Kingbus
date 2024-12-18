//
//  MainViewController.swift
//  Kingbus
//
//  Created by 이주성 on 12/14/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "일정을 알려주세요\n견적을 안내해 드릴게요"
        label.textColor = .white
        label.font = .useFont(ofSize: 24, weight: .Bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var estimateCountBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .useRGB(red: 190, green: 44, blue: 44)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var todayEstimateBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var todayEstiamteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "당일 견적"
        label.textColor = .useRGB(red: 247, green: 206, blue: 206)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var todayEstimateLabel: UILabel = {
        let label = UILabel()
        label.text = "120건"
        label.textColor = .white
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .useRGB(red: 235, green: 127, blue: 127)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var accumulatedEstimateBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var accumulatedEstiamteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "누적 견적"
        label.textColor = .useRGB(red: 247, green: 206, blue: 206)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var accumulatedEstimateLabel: UILabel = {
        let label = UILabel()
        label.text = "1,921,123건"
        label.textColor = .white
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var contentBaesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var locationTitleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("locationIcon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var locationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "출/도착지를 알려 주세요"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 16, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var textFieldBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var departureTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.setPlaceholder(placeholder: "출발지")
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.layer.cornerRadius = 8
        textField.addLeftPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var departureButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(departureButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var changeTextButtton: UIButton = {
        let button = UIButton()
        button.setImage(.useCustomImage("changeTextButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(changeTextButtton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var arrivalTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.setPlaceholder(placeholder: "도착지")
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.layer.cornerRadius = 8
        textField.addLeftPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var arrivalButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(arrivalButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var searchBackgroundView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .useRGB(red: 0, green: 0, blue: 0, alpha: 0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchBaseView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .useRGB(red: 46, green: 45, blue: 45)
        textField.font = .useFont(ofSize: 14, weight: .Regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    var searchBaseViewBottomAnchorConstraint: NSLayoutConstraint!
    
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
        print("----------------------------------- MainViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension MainViewController: EssentialViewMethods {
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
            self.scrollView,
            self.searchBackgroundView,
            self.searchBaseView,
        ], to: self.view)
        
        SupportingMethods.shared.addSubviews([
            self.baseView,
        ], to: self.scrollView)
        
        SupportingMethods.shared.addSubviews([
            self.titleLabel,
            self.estimateCountBaseView,
            self.contentBaesView,
        ], to: self.baseView)
        
        SupportingMethods.shared.addSubviews([
            self.todayEstimateBaseView,
            self.separateView,
            self.accumulatedEstimateBaseView,
        ], to: self.estimateCountBaseView)
        
        SupportingMethods.shared.addSubviews([
            self.todayEstiamteTitleLabel,
            self.todayEstimateLabel,
        ], to: self.todayEstimateBaseView)
        
        SupportingMethods.shared.addSubviews([
            self.accumulatedEstiamteTitleLabel,
            self.accumulatedEstimateLabel,
        ], to: self.accumulatedEstimateBaseView)
        
        SupportingMethods.shared.addSubviews([
            self.locationTitleImageView,
            self.locationTitleLabel,
            
            self.textFieldBaseView,
            self.departureTextField,
            self.departureButton,
            self.arrivalTextField,
            self.arrivalButton,
            self.changeTextButtton,
        ], to: self.contentBaesView)
        
        SupportingMethods.shared.addSubviews([
            self.searchTextField,
        ], to: self.searchBaseView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // scrollView
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        
        // baseView
        NSLayoutConstraint.activate([
            self.baseView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.baseView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.baseView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.baseView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.baseView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.baseView.heightAnchor.constraint(equalToConstant: 1000),
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.titleLabel.topAnchor.constraint(equalTo: self.baseView.topAnchor, constant: 36),
        ])
        
        // estimateCountBaseView
        NSLayoutConstraint.activate([
            self.estimateCountBaseView.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor, constant: 20),
            self.estimateCountBaseView.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor, constant: -20),
            self.estimateCountBaseView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.estimateCountBaseView.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // todayEstimateBaseView
        NSLayoutConstraint.activate([
            self.todayEstimateBaseView.leadingAnchor.constraint(equalTo: self.estimateCountBaseView.leadingAnchor),
            self.todayEstimateBaseView.topAnchor.constraint(equalTo: self.estimateCountBaseView.topAnchor),
            self.todayEstimateBaseView.bottomAnchor.constraint(equalTo: self.estimateCountBaseView.bottomAnchor),
            self.todayEstimateBaseView.widthAnchor.constraint(equalToConstant: (ReferenceValues.Size.Device.width - 41) / 2.0)
        ])
        
        // todayEstiamteTitleLabel
        NSLayoutConstraint.activate([
            self.todayEstiamteTitleLabel.leadingAnchor.constraint(equalTo: self.todayEstimateBaseView.leadingAnchor, constant: 12),
            self.todayEstiamteTitleLabel.centerYAnchor.constraint(equalTo: self.todayEstimateBaseView.centerYAnchor),
        ])
        
        // todayEstimateLabel
        NSLayoutConstraint.activate([
            self.todayEstimateLabel.leadingAnchor.constraint(equalTo: self.todayEstiamteTitleLabel.trailingAnchor, constant: 8),
            self.todayEstimateLabel.trailingAnchor.constraint(equalTo: self.todayEstimateBaseView.trailingAnchor, constant: -8),
            self.todayEstimateLabel.centerYAnchor.constraint(equalTo: self.todayEstimateBaseView.centerYAnchor),
        ])
        
        // separateView
        NSLayoutConstraint.activate([
            self.separateView.leadingAnchor.constraint(equalTo: self.todayEstimateBaseView.trailingAnchor),
            self.separateView.trailingAnchor.constraint(equalTo: self.accumulatedEstimateBaseView.leadingAnchor),
            self.separateView.topAnchor.constraint(equalTo: self.estimateCountBaseView.topAnchor, constant: 12),
            self.separateView.bottomAnchor.constraint(equalTo: self.estimateCountBaseView.bottomAnchor, constant: -12),
            self.separateView.widthAnchor.constraint(equalToConstant: 1),
        ])
        
        // accumulatedEstimateBaseView
        NSLayoutConstraint.activate([
            self.accumulatedEstimateBaseView.trailingAnchor.constraint(equalTo: self.estimateCountBaseView.trailingAnchor),
            self.accumulatedEstimateBaseView.topAnchor.constraint(equalTo: self.estimateCountBaseView.topAnchor),
            self.accumulatedEstimateBaseView.bottomAnchor.constraint(equalTo: self.estimateCountBaseView.bottomAnchor),
            self.accumulatedEstimateBaseView.widthAnchor.constraint(equalToConstant: (ReferenceValues.Size.Device.width - 41) / 2.0)
        ])
        
        // accumulatedEstiamteTitleLabel
        NSLayoutConstraint.activate([
            self.accumulatedEstiamteTitleLabel.leadingAnchor.constraint(equalTo: self.accumulatedEstimateBaseView.leadingAnchor, constant: 12),
            self.accumulatedEstiamteTitleLabel.centerYAnchor.constraint(equalTo: self.accumulatedEstimateBaseView.centerYAnchor),
        ])
        
        // accumulatedEstimateLabel
        NSLayoutConstraint.activate([
            self.accumulatedEstimateLabel.leadingAnchor.constraint(equalTo: self.accumulatedEstiamteTitleLabel.trailingAnchor, constant: 8),
            self.accumulatedEstimateLabel.trailingAnchor.constraint(equalTo: self.accumulatedEstimateBaseView.trailingAnchor, constant: -8),
            self.accumulatedEstimateLabel.centerYAnchor.constraint(equalTo: self.accumulatedEstimateBaseView.centerYAnchor),
        ])
        
        // contentBaesView
        NSLayoutConstraint.activate([
            self.contentBaesView.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor),
            self.contentBaesView.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor),
            self.contentBaesView.topAnchor.constraint(equalTo: self.estimateCountBaseView.bottomAnchor, constant: 24),
            self.contentBaesView.bottomAnchor.constraint(equalTo: self.baseView.bottomAnchor),
        ])
        
        // locationTitleImageView
        NSLayoutConstraint.activate([
            self.locationTitleImageView.leadingAnchor.constraint(equalTo: self.contentBaesView.leadingAnchor, constant: 20),
            self.locationTitleImageView.topAnchor.constraint(equalTo: self.contentBaesView.topAnchor, constant: 28),
            self.locationTitleImageView.widthAnchor.constraint(equalToConstant: 24),
            self.locationTitleImageView.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        // locationTitleLabel
        NSLayoutConstraint.activate([
            self.locationTitleLabel.leadingAnchor.constraint(equalTo: self.locationTitleImageView.trailingAnchor, constant: 8),
            self.locationTitleLabel.centerYAnchor.constraint(equalTo: self.locationTitleImageView.centerYAnchor),
        ])
        
        // textFieldBaseView
        NSLayoutConstraint.activate([
            self.textFieldBaseView.leadingAnchor.constraint(equalTo: self.contentBaesView.leadingAnchor, constant: 20),
            self.textFieldBaseView.trailingAnchor.constraint(equalTo: self.contentBaesView.trailingAnchor, constant: -20),
            self.textFieldBaseView.topAnchor.constraint(equalTo: self.locationTitleLabel.bottomAnchor, constant: 12),
            self.textFieldBaseView.heightAnchor.constraint(equalToConstant: 104),
        ])
        
        // departureTextField
        NSLayoutConstraint.activate([
            self.departureTextField.leadingAnchor.constraint(equalTo: self.textFieldBaseView.leadingAnchor),
            self.departureTextField.trailingAnchor.constraint(equalTo: self.textFieldBaseView.trailingAnchor),
            self.departureTextField.topAnchor.constraint(equalTo: self.textFieldBaseView.topAnchor),
            self.departureTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // departureButton
        NSLayoutConstraint.activate([
            self.departureButton.leadingAnchor.constraint(equalTo: self.departureTextField.leadingAnchor),
            self.departureButton.trailingAnchor.constraint(equalTo: self.departureTextField.trailingAnchor),
            self.departureButton.topAnchor.constraint(equalTo: self.departureTextField.topAnchor),
            self.departureButton.bottomAnchor.constraint(equalTo: self.departureTextField.bottomAnchor),
        ])

        // arrivalTextField
        NSLayoutConstraint.activate([
            self.arrivalTextField.leadingAnchor.constraint(equalTo: self.textFieldBaseView.leadingAnchor),
            self.arrivalTextField.trailingAnchor.constraint(equalTo: self.textFieldBaseView.trailingAnchor),
            self.arrivalTextField.topAnchor.constraint(equalTo: self.departureTextField.bottomAnchor, constant: 8),
            self.arrivalTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // arrivalButton
        NSLayoutConstraint.activate([
            self.arrivalButton.leadingAnchor.constraint(equalTo: self.arrivalTextField.leadingAnchor),
            self.arrivalButton.trailingAnchor.constraint(equalTo: self.arrivalTextField.trailingAnchor),
            self.arrivalButton.topAnchor.constraint(equalTo: self.arrivalTextField.topAnchor),
            self.arrivalButton.bottomAnchor.constraint(equalTo: self.arrivalTextField.bottomAnchor),
        ])
        
        // changeTextButtton
        NSLayoutConstraint.activate([
            self.changeTextButtton.centerYAnchor.constraint(equalTo: self.textFieldBaseView.centerYAnchor),
            self.changeTextButtton.centerXAnchor.constraint(equalTo: self.textFieldBaseView.centerXAnchor),
            self.changeTextButtton.heightAnchor.constraint(equalToConstant: 28),
            self.changeTextButtton.widthAnchor.constraint(equalToConstant: 47),
        ])
        
        // searchBackgroundView
        NSLayoutConstraint.activate([
            self.searchBackgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.searchBackgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.searchBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.searchBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        // searchBaseView
        self.searchBaseViewBottomAnchorConstraint = self.searchBaseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            self.searchBaseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.searchBaseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.searchBaseView.heightAnchor.constraint(equalToConstant: 440),
            self.searchBaseViewBottomAnchorConstraint,
        ])
        
        // searchTextField
        NSLayoutConstraint.activate([
            self.searchTextField.leadingAnchor.constraint(equalTo: self.searchBaseView.leadingAnchor, constant: 20),
            self.searchTextField.trailingAnchor.constraint(equalTo: self.searchBaseView.trailingAnchor, constant: -20),
            self.searchTextField.topAnchor.constraint(equalTo: self.searchBaseView.topAnchor, constant: 36)
        ])
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpNavigationItem() {
        self.view.backgroundColor = .useRGB(red: 223, green: 52, blue: 52)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear // Navigation bar is transparent and root view appears on it.
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor.useRGB(red: 66, green: 66, blue: 66),
            .font:UIFont.useFont(ofSize: 18, weight: .Bold)
        ]
        
        // MARK: NavigationItem appearance for each view controller
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        
        self.navigationItem.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "kingbus.word.icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "notificationIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
    }
}

// MARK: - Extension for methods added
extension MainViewController {
    
}

// MARK: - Extension for selector methods
extension MainViewController {
    @objc func departureButton(_ sender: UIButton) {
        print("departureButton")
        self.searchTextField.setPlaceholder(placeholder: "출발지 검색")
        self.searchTextField.becomeFirstResponder()
        self.searchBackgroundView.isHidden = false
        self.searchBaseView.isHidden = false
        
    }
    
    @objc func arrivalButton(_ sender: UIButton) {
        print("arrivalButton")
        self.searchTextField.setPlaceholder(placeholder: "도착지 검색")
        self.searchTextField.becomeFirstResponder()
        self.searchBackgroundView.isHidden = false
        self.searchBaseView.isHidden = false
        
    }
    
    @objc func changeTextButtton(_ sender: UIButton) {
        let departure = self.departureTextField.text!
        let arrival = self.arrivalTextField.text!
        
        self.departureTextField.text = arrival
        self.arrivalTextField.text = departure
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.transition(with: self.view, duration: duration) {
                self.searchBaseViewBottomAnchorConstraint.constant = -keyboardSize.height
                
                self.view.layoutIfNeeded()
            }
            
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.transition(with: self.view, duration: duration) {
                self.searchBaseViewBottomAnchorConstraint.constant = 0
                
            }
            
        }
        
    }
    
}
