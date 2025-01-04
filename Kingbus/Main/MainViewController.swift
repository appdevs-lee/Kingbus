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
        textField.backgroundColor = .useRGB(red: 248, green: 248, blue: 248)
        textField.borderStyle = .none
        textField.layer.cornerRadius = 8
        textField.addLeftPadding()
        textField.returnKeyType = .search
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var deleteTextButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(.useCustomImage("deleteTextImage"), for: .normal)
        button.addTarget(self, action: #selector(deleteTextButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var recentSearchBaseView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var recentSearchTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 검색"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var recentSearchDeleteAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체 삭제", for: .normal)
        button.setTitleColor(.useRGB(red: 148, green: 147, blue: 147), for: .normal)
        button.titleLabel?.font = .useFont(ofSize: 12, weight: .Regular)
        button.addTarget(self, action: #selector(recentSearchDeleteAllButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var recentSearchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RecentSearchTableViewCell.self, forCellReuseIdentifier: "RecentSearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var noResultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.noResultImageView, self.noResultLabelStackView])
        stackView.isHidden = true
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var noResultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("noResultImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var noResultLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.noResultTitleLabel, self.noResultSubTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var noResultTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없어요"
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 16, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var noResultSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "다시 검색해 주세요"
        label.textColor = .useRGB(red: 148, green: 147, blue: 147)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    var searchBaseViewBottomAnchorConstraint: NSLayoutConstraint!
    
    let mainModel = MainModel()
    var searchPlaceList: [SearchData] = []
    var page: Int = 1
    var isEnd: Bool = false
    
    enum SearchType {
        case departure
        case arrival
    }
    var searchType: SearchType?
    
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
        self.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        self.searchBackgroundView.isHidden = true
        self.searchBaseView.isHidden = true
        
    }
    
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
            self.deleteTextButton,
            self.tableView,
            self.noResultStackView,
            self.recentSearchBaseView,
        ], to: self.searchBaseView)
        
        SupportingMethods.shared.addSubviews([
            self.recentSearchTitleLabel,
            self.recentSearchDeleteAllButton,
            self.recentSearchTableView,
        ], to: self.recentSearchBaseView)
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
            self.searchTextField.topAnchor.constraint(equalTo: self.searchBaseView.topAnchor, constant: 36),
            self.searchTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        // deleteTextButton
        NSLayoutConstraint.activate([
            self.deleteTextButton.trailingAnchor.constraint(equalTo: self.searchTextField.trailingAnchor, constant: -20),
            self.deleteTextButton.centerYAnchor.constraint(equalTo: self.searchTextField.centerYAnchor),
            self.deleteTextButton.widthAnchor.constraint(equalToConstant: 20),
            self.deleteTextButton.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // tableView
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.searchBaseView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.searchBaseView.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.searchTextField.bottomAnchor, constant: 22),
            self.tableView.bottomAnchor.constraint(equalTo: self.searchBaseView.bottomAnchor),
        ])
        
        // noResultStackView
        NSLayoutConstraint.activate([
            self.noResultStackView.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor),
            self.noResultStackView.leadingAnchor.constraint(equalTo: self.searchBaseView.leadingAnchor, constant: 20),
            self.noResultStackView.trailingAnchor.constraint(equalTo: self.searchBaseView.trailingAnchor, constant: -20),
        ])
        
        // noResultImageView
        NSLayoutConstraint.activate([
            self.noResultImageView.heightAnchor.constraint(equalToConstant: 36),
            self.noResultImageView.widthAnchor.constraint(equalToConstant: 36),
        ])
        
        // recentSearchBaseView
        NSLayoutConstraint.activate([
            self.recentSearchBaseView.leadingAnchor.constraint(equalTo: self.searchBaseView.leadingAnchor, constant: 20),
            self.recentSearchBaseView.trailingAnchor.constraint(equalTo: self.searchBaseView.trailingAnchor, constant: -20),
            self.recentSearchBaseView.topAnchor.constraint(equalTo: self.searchTextField.bottomAnchor, constant: 32),
        ])
        
        // recentSearchTitleLabel
        NSLayoutConstraint.activate([
            self.recentSearchTitleLabel.leadingAnchor.constraint(equalTo: self.recentSearchBaseView.leadingAnchor),
            self.recentSearchTitleLabel.topAnchor.constraint(equalTo: self.recentSearchBaseView.topAnchor),
            self.recentSearchTitleLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // recentSearchDeleteAllButton
        NSLayoutConstraint.activate([
            self.recentSearchDeleteAllButton.trailingAnchor.constraint(equalTo: self.recentSearchBaseView.trailingAnchor),
            self.recentSearchDeleteAllButton.centerYAnchor.constraint(equalTo: self.recentSearchTitleLabel.centerYAnchor),
            self.recentSearchDeleteAllButton.heightAnchor.constraint(equalToConstant: 16),
            self.recentSearchDeleteAllButton.widthAnchor.constraint(equalToConstant: 47),
        ])
        
        // recentSearchTableView
        NSLayoutConstraint.activate([
            self.recentSearchTableView.leadingAnchor.constraint(equalTo: self.recentSearchBaseView.leadingAnchor),
            self.recentSearchTableView.trailingAnchor.constraint(equalTo: self.recentSearchBaseView.trailingAnchor),
            self.recentSearchTableView.topAnchor.constraint(equalTo: self.recentSearchTitleLabel.bottomAnchor, constant: 10),
            self.recentSearchTableView.bottomAnchor.constraint(equalTo: self.recentSearchBaseView.bottomAnchor, constant: -10),
            self.recentSearchTableView.heightAnchor.constraint(equalToConstant: 168),
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
    
    func setData() {
        if !SupportingMethods.shared.loadSearchList().isEmpty {
            self.recentSearchBaseView.isHidden = false
            
        } else {
            self.recentSearchBaseView.isHidden = true
            
        }
        
        self.recentSearchTableView.reloadData()
        
    }
    
}

// MARK: - Extension for methods added
extension MainViewController {
    func loadSearchedPlaceDataRequest(page: Int, search: String, success: ((Search) -> ())?) {
        self.mainModel.loadSearchedPlaceDataRequest( page: page, search: search) { result in
            success?(result)
            
        } failure: { message in
            SupportingMethods.shared.checkExpiration {
                print("loadSearchedPlaceDataRequest API Error: \(message)")
                SupportingMethods.shared.turnCoverView(.off)
                
            }
            
        }

    }
    
    func loadSearchPlaceDataRequest(page: Int, search: String) {
        SupportingMethods.shared.turnCoverView(.on)
        self.loadSearchedPlaceDataRequest(page: page, search: search) { result in
            self.page = page
            self.isEnd = result.meta.isEnd
            
            if !result.meta.isEnd {
                self.searchPlaceList += result.documents
                
            }
            
            SupportingMethods.shared.turnCoverView(.off)
            self.tableView.reloadData()
            
        }
        
    }
    
    func loadSearchPlaceDataRequest(search: String) {
        self.loadSearchedPlaceDataRequest(page: 1, search: search) { result in
            self.page = 1
            self.isEnd = result.meta.isEnd
            
            if result.documents.isEmpty {
                self.searchPlaceList = []
                
                if SupportingMethods.shared.loadSearchList().isEmpty {
                    self.noResultStackView.isHidden = false
                    self.recentSearchBaseView.isHidden = true
                    
                } else {
                    self.recentSearchBaseView.isHidden = false
                    self.noResultStackView.isHidden = true
                    
                }
                
            } else {
                self.recentSearchBaseView.isHidden = true
                self.noResultStackView.isHidden = true
                self.searchPlaceList = result.documents
                
            }
            
            SupportingMethods.shared.turnCoverView(.off)
            self.tableView.reloadData()
            self.recentSearchTableView.reloadData()
            
        }
    }
    
}

// MARK: - Extension for selector methods
extension MainViewController {
    @objc func departureButton(_ sender: UIButton) {
        print("departureButton")
        self.searchType = .departure
        self.searchTextField.text = self.departureTextField.text
        self.searchTextField.setPlaceholder(placeholder: "출발지 검색")
        self.searchTextField.becomeFirstResponder()
        self.searchBackgroundView.isHidden = false
        self.searchBaseView.isHidden = false
        
    }
    
    @objc func arrivalButton(_ sender: UIButton) {
        print("arrivalButton")
        self.searchType = .arrival
        self.searchTextField.text = self.arrivalTextField.text
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
    
    @objc func recentSearchDeleteAllButton(_ sender: UIButton) {
        SupportingMethods.shared.saveSearchList(searchList: [])
        self.recentSearchTableView.reloadData()
        self.recentSearchBaseView.isHidden = true
        
    }
    
    @objc func deleteTextButton(_ sender: UIButton) {
        self.searchTextField.text = ""
        self.searchPlaceList.removeAll()
        if SupportingMethods.shared.loadSearchList().isEmpty {
            self.recentSearchBaseView.isHidden = true
            
        } else {
            self.recentSearchBaseView.isHidden = false
            
        }
        
        self.tableView.reloadData()
        self.recentSearchTableView.reloadData()
        
    }
    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loadSearchPlaceDataRequest(search: textField.text!)
        return true
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.loadSearchPlaceDataRequest(search: textField.text!)
        
        if textField.text == "" {
            self.deleteTextButton.isHidden = true
            
        } else {
            self.deleteTextButton.isHidden = false
            
        }
        
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.recentSearchTableView {
            return SupportingMethods.shared.loadSearchList().count
            
        } else {
            return self.searchPlaceList.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.recentSearchTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentSearchTableViewCell", for: indexPath) as! RecentSearchTableViewCell
            let searchPlace = SupportingMethods.shared.loadSearchList()[indexPath.row]
            
            cell.setCell(searchPlace: searchPlace)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            let searchPlace = self.searchPlaceList[indexPath.row]
            
            cell.setCell(searchPlace: searchPlace)
            
            if indexPath.row == self.searchPlaceList.count - 1 && !self.isEnd {
                self.loadSearchPlaceDataRequest(page: self.page + 1, search: self.searchTextField.text!)
                
            }
            
            return cell
            
        }

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var result: SearchData!
        if tableView == self.recentSearchTableView {
            let searchPlace = SupportingMethods.shared.loadSearchList()[indexPath.row]
            print(searchPlace)
            result = searchPlace
            
        } else {
            let searchPlace = self.searchPlaceList[indexPath.row]
            var searchList = SupportingMethods.shared.loadSearchList()
            searchList = searchList.filter({ $0.id != searchPlace.id })
            searchList.insert(searchPlace, at: 0)
            SupportingMethods.shared.saveSearchList(searchList: searchList)
            self.recentSearchTableView.reloadData()
            
            print(searchPlace)
            result = searchPlace
            
        }
        
        switch self.searchType {
        case .departure:
            // FIXME: 출발지 저장 코드 추가
            self.departureTextField.text = result.placeName
            
        case .arrival:
            // FIXME: 도착지 저장 코드 추가
            self.arrivalTextField.text = result.placeName
            
        default: break
        }
        
        self.searchTextField.resignFirstResponder()
        self.searchBackgroundView.isHidden = true
        self.searchBaseView.isHidden = true
        
    }
    
}
