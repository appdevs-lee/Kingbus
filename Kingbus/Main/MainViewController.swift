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
        
    }
    
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.scrollView,
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
        
        ], to: self.contentBaesView)
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
    
}
