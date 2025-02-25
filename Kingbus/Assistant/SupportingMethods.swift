//
//  SupportingMethods.swift
//  Universal
//
//  Created by Yongseok Choi on 2023/04/04.
//


import Foundation
import UIKit
import Photos
import PhotosUI

enum CoverViewState {
    case on
    case off
}

enum PickerType {
    case image
    case video
}

class SupportingMethods {
    private var notiAnimator: UIViewPropertyAnimator?
    private var notiViewBottomAnchor: NSLayoutConstraint!
    private var notiStackViewTrailingAnchor: NSLayoutConstraint!
    private var notiButtonAction: (() -> ())?
    
    private lazy var notiBaseView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var notiView: UIView = {
        let view = UIView()
        view.backgroundColor = .useRGB(red: 37, green: 35, blue: 35)
        view.layer.cornerRadius = 24
        view.layer.useSketchShadow(color: .black, alpha: 0.15, x: 0, y: 4, blur: 8, spread: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var notiContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var notiImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "notiIcon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var notiTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .useFont(ofSize: 16, weight: .Regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Noti Title"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var notiButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.useRGB(red: 131, green: 164, blue: 245), for: .normal)
        button.titleLabel?.font = .useFont(ofSize: 16, weight: .Bold)
        button.addTarget(self, action: #selector(notiButton(_:)), for: .touchUpInside)
        button.setTitle("Button Title", for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var coverView: UIView = {
        // Cover View
        let coverView = UIView()
        coverView.backgroundColor = UIColor.useRGB(red: 0, green: 0, blue: 0, alpha: 0.1)
        coverView.isHidden = true
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        // Activity Indicator View
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        coverView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            // Activity Indicator
            activityIndicator.centerYAnchor.constraint(equalTo: coverView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: coverView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        
        return coverView
    }()
    
    static let shared = SupportingMethods()
    
    private init() {
        self.initializeAlertNoti()
        self.initializeCoverView()
    }
}

// MARK: - Extension for methods added
extension SupportingMethods {
    // MARK: Initial views
    // alert noti view
    func initializeAlertNoti() {
        let window: UIWindow! = ReferenceValues.keyWindow
        
        self.addSubviews([
            self.notiBaseView
        ], to: window)
        
        self.addSubviews([
            self.notiView
        ], to: self.notiBaseView)
        
        self.addSubviews([
            self.notiContentStackView,
            self.notiButton
        ], to: self.notiView)
        
        // notiBaseView
        NSLayoutConstraint.activate([
            self.notiBaseView.topAnchor.constraint(equalTo: window.topAnchor),
            self.notiBaseView.heightAnchor.constraint(equalToConstant: 150),
            self.notiBaseView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            self.notiBaseView.trailingAnchor.constraint(equalTo: window.trailingAnchor)
        ])
        
        // notiView
        self.notiViewBottomAnchor = self.notiView.bottomAnchor.constraint(equalTo: self.notiBaseView.topAnchor)
        NSLayoutConstraint.activate([
            self.notiViewBottomAnchor,
            self.notiView.heightAnchor.constraint(greaterThanOrEqualToConstant: 48),
            self.notiView.leadingAnchor.constraint(equalTo: self.notiBaseView.leadingAnchor, constant: 20),
            self.notiView.trailingAnchor.constraint(equalTo: self.notiBaseView.trailingAnchor, constant: -20)
        ])
        
        // notiContentStackView
        self.notiStackViewTrailingAnchor = self.notiContentStackView.trailingAnchor.constraint(equalTo: self.notiView.trailingAnchor, constant: -20)
        NSLayoutConstraint.activate([
            self.notiContentStackView.topAnchor.constraint(equalTo: self.notiView.topAnchor, constant: 18.5),
            self.notiContentStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 19),
            self.notiContentStackView.bottomAnchor.constraint(equalTo: self.notiView.bottomAnchor, constant: -18.5),
            self.notiContentStackView.leadingAnchor.constraint(equalTo: self.notiView.leadingAnchor, constant: 20),
            self.notiStackViewTrailingAnchor
        ])
        
        // notiImageView
        NSLayoutConstraint.activate([
            self.notiImageView.heightAnchor.constraint(equalToConstant: 24),
            self.notiImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        // notiButton
        NSLayoutConstraint.activate([
            self.notiButton.centerYAnchor.constraint(equalTo: self.notiView.centerYAnchor),
            self.notiButton.trailingAnchor.constraint(equalTo: self.notiView.trailingAnchor, constant: -16),
        ])
    }
    
    // cover view
    func initializeCoverView() {
        let window: UIWindow! = ReferenceValues.keyWindow
        
        self.addSubviews([
            self.coverView
        ], to: window)
        
        // coverView
        NSLayoutConstraint.activate([
            self.coverView.topAnchor.constraint(equalTo: window.topAnchor),
            self.coverView.bottomAnchor.constraint(equalTo: window.bottomAnchor),
            self.coverView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            self.coverView.trailingAnchor.constraint(equalTo: window.trailingAnchor)
        ])
    }
    
    // MARK: Show alert noti
    func showAlertNoti(title: String, button: (title: String, notiButtonAction:(() -> ())?)? = nil) {
        ReferenceValues.keyWindow.bringSubviewToFront(self.notiBaseView)
        
        // Set noti label and button
        self.notiTitleLabel.text = title
        self.notiButton.setTitle(button?.title, for: .normal)
        if let notiButtonAction = button?.notiButtonAction {
            self.notiButtonAction = notiButtonAction
            self.notiButton.isHidden = false
            
            NSLayoutConstraint.deactivate([
                self.notiStackViewTrailingAnchor
            ])
            self.notiStackViewTrailingAnchor = self.notiContentStackView.trailingAnchor.constraint(equalTo: self.notiButton.leadingAnchor, constant: -4)
            NSLayoutConstraint.activate([
                self.notiStackViewTrailingAnchor
            ])
            
        } else {
            self.notiButtonAction = nil
            self.notiButton.isHidden = true
            
            NSLayoutConstraint.deactivate([
                self.notiStackViewTrailingAnchor
            ])
            self.notiStackViewTrailingAnchor = self.notiContentStackView.trailingAnchor.constraint(equalTo: self.notiView.trailingAnchor, constant: -16)
            NSLayoutConstraint.activate([
                self.notiStackViewTrailingAnchor
            ])
        }
        self.notiBaseView.layoutIfNeeded()
        
        // Animating
        self.notiAnimator?.stopAnimation(false)
        self.notiAnimator?.finishAnimation(at: .end)
        
        if self.notiAnimator == nil || self.notiAnimator?.state == .inactive {
            self.notiBaseView.isHidden = false
            
            self.notiAnimator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.6, animations: {
                self.notiViewBottomAnchor.constant = ReferenceValues.Size.SafeAreaInsets.top + 8 + self.notiView.frame.height
                self.notiBaseView.layoutIfNeeded()
            })
            
            self.notiAnimator?.addCompletion({ position in
                switch position {
                case .end:
                    //print("position end")
                    self.hideNotiAlert()
                    
                default:
                    break
                }
            })
            
            self.notiAnimator?.startAnimation()
        }
    }
    
    private func hideNotiAlert() {
        //print("close")
        self.notiAnimator = UIViewPropertyAnimator(duration: 0.15, curve: .easeIn, animations: {
            self.notiViewBottomAnchor.constant = 0
            self.notiBaseView.layoutIfNeeded()
        })
        self.notiAnimator?.addCompletion({ position in
            switch position {
            case .end:
                //print("second position end")
                self.notiBaseView.isHidden = true
                
            default:
                break
            }
        })
        self.notiAnimator?.startAnimation(afterDelay: 3.0)
    }
    
    @objc private func notiButton(_ sender: UIButton) {
        if let action = self.notiButtonAction {
            action()
            
            self.notiButtonAction = nil
        }
    }
    
    // MARK: Add Subviews
    func addSubviews(_ views: [UIView], to: UIView) {
        for view in views {
            to.addSubview(view)
        }
    }
    
    // MARK: Cover view
    func turnCoverView(_ state: CoverViewState) {
        ReferenceValues.keyWindow.bringSubviewToFront(self.coverView)
        
        switch state {
        case .on:
            self.coverView.isHidden = false
            
        case .off:
            self.coverView.isHidden = true
        }
    }
    
    // MARK: Get Top ViewController
    func getTopVC(_ windowRootVC: UIViewController?) -> UIViewController? {
        var topVC = windowRootVC
        while true {
            if let top = topVC?.presentedViewController {
                topVC = top
                
            } else if let base = topVC as? UINavigationController, let top = base.visibleViewController {
                topVC = top
                
            } else if let base = topVC as? UITabBarController, let top = base.selectedViewController {
                topVC = top
                
            } else {
                break
            }
        }
        
        return topVC
    }
    
    // MARK: Get NavigationBar Height
    func getNavigationBarHeight(_ vc: UIViewController?) -> CGFloat {
        if let naviVC = vc?.navigationController {
            return naviVC.navigationBar.frame.height
            
        }
        
        return 0
    }
    
    // MARK: Determine app state
    enum AppState {
        case terminate
        case logout
        case networkError
        case serverError
        case expired
    }
    
    func determineAppState(_ state: AppState) {
        switch state {
        case .terminate:
            exit(0)
            
        case .logout:
            break
            
        case .networkError:
            guard let _ = ReferenceValues.firstVC?.presentedViewController as? CustomizedTabBarController else {
                ReferenceValues.firstVC?.dismiss(animated: true)
                
                return
            }
            
            ReferenceValues.firstVC?.dismiss(animated: false)
            ReferenceValues.firstVC?.navigationController?.popToRootViewController(animated: false)
            
        case .serverError:
            guard let _ = ReferenceValues.firstVC?.presentedViewController as? CustomizedTabBarController else {
                ReferenceValues.firstVC?.dismiss(animated: true)
                
                return
            }
            
            ReferenceValues.firstVC?.dismiss(animated: false)
            ReferenceValues.firstVC?.navigationController?.popToRootViewController(animated: false)
        case .expired:
            // expired state
            
            break
        }
    }
    
    func checkExpiration(completion: (() -> ())?) {
        completion?()
        
        let vc = AlertPopViewController(.normalTwoButton(messageTitle: "서비스 접속이 원활하지 않습니다", messageContent: "잠시 후 다시 시도해 주세요.", leftButtonTitle: "앱 종료", leftAction: {
            exit(0)
            
        }, rightButtonTitle: "재접속", rightAction: {
            self.determineAppState(.serverError)
        }))
        
        if let topVC = SupportingMethods.shared.getTopVC(ReferenceValues.keyWindow.rootViewController) {
            if let presentingVC = topVC.presentingViewController, let _ = topVC as? AlertPopViewController {
                presentingVC.dismiss(animated: false) {
                    presentingVC.present(vc, animated: true)
                }
                
            } else {
                topVC.present(vc, animated: true)
            }
        }
        
        self.turnCoverView(.off)
    }
    
    // String -> Date
    func convertString(intoDate dateString: String, _ dateFormat: String = "yyyy-MM-dd") -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")!
        formatter.dateFormat = dateFormat
        
        return formatter.date(from: dateString)!
    }
    
    // Date -> String
    func convertDate(intoString date: Date, _ dateFormat: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")!
        formatter.dateFormat = dateFormat
        
        return formatter.string(from: date)
    }
    
    // String -> Date -> Custom String
    func convertString(intoCustomString dateString: String, _ dateFormat: String = "yyyy-MM-dd HH:mm") -> String {
        let date = self.convertString(intoDate: dateString, "yyyy-MM-dd HH:mm")
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")!
        formatter.dateFormat = dateFormat
        
        return formatter.string(from: date)
    }
    
    func calculateAMorPM(date: String) -> String {
        var result: String = ""
        let dateString = date.split(separator: ":")
        if Int(dateString[0])! < 12 {
            result = "오전 \(date)"
            
        } else {
            result = "오후 \(date)"
            
        }
        
        return result
    }
    
    enum TimeIntervalSecond: Int {
        case twentyMintesAgo = 1200 // 30분 전
        case aHourAgo = 3600 // 1시간 전
        case anHourAndAHalfAgo = 5400 // 1시간 30분 전
    }
    
    func calculateDateAsTimeInterval(date: Date, second: TimeIntervalSecond) -> String {
        var result: String = ""
        let calculatedDate = self.calculateDate(byValue: -second.rawValue, component: .second, date: date)
        
        result = SupportingMethods.shared.convertDate(intoString: calculatedDate, "a HH:mm")
        
        return result
    }
    
    func calculateDate(byValue value: Int, component: Calendar.Component, date: Date? = nil) -> Date {
        let selectedDate = date != nil ? date : Date()
        
        return Calendar.current.date(byAdding: component, value: value, to: selectedDate!)!
    }
    
    // MARK: About time
    func makeDateFormatter(_ format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") //Locale.current
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")!
        dateFormatter.dateFormat = format
        
        return dateFormatter
    }
    
    func calculatePassedTime(_ targetDate: Date?) -> String? {
        guard let targetDate = targetDate else {
            return nil
        }
        
        let now: Int = Int(Date().timeIntervalSince1970)
        let target = Int(targetDate.timeIntervalSince1970)
        let seconds = now - target // time interval between now and target time
        
        if seconds < 3600 { // 1시간 미만
            let minutes = seconds / 60
            if minutes <= 0 {
                return "방금전"
                
            } else {
                return "\(minutes)분 전"
            }
            
        } else if seconds >= 3600 && seconds < 3600 * 24 { // 1시간 이상 1일(24시간) 미만
            let hours = seconds / 3600
            return "\(hours)시간 전"
            
        } else if seconds >= 3600 * 24 && seconds < 3600 * 24 * 7 { // 1일 이상 1주일(7일) 미만
            let days = seconds / (3600 * 24)
            return "\(days)일 전"
            
        } else { // 1주일(7일) 이상
            let dateFormatter = self.makeDateFormatter("yyyy.MM.dd")
            return dateFormatter.string(from: targetDate)
        }
    }
    
    func isLaterThanTargetDate(_ date: Date = Date(), targetDate: Date, timeZone: TimeZone = TimeZone(abbreviation: "KST")!, locale: Locale = Locale(identifier: "ko_KR")) -> Bool {
        var calendar = Calendar.current
        calendar.locale = locale
        calendar.timeZone = timeZone
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let targetDateComponents = calendar.dateComponents([.year, .month, .day], from: targetDate)
        
        let date = calendar.date(from: DateComponents(year: dateComponents.year!, month: dateComponents.month!, day: dateComponents.day!, hour: 0, minute: 0, second: 0))!
        let targetDate = calendar.date(from: DateComponents(year: targetDateComponents.year!, month: targetDateComponents.month!, day: targetDateComponents.day!, hour: 0, minute: 0, second: 0))!
        
        return date > targetDate
    }
    
    // MARK: Manage contents (photo / movie)
    func gatherDataFromPickedContents(index: Int, pickerType: PickerType, pickedResults: [String:PHPickerResult], selectedIdentifiers: [String], contentsMetaData: [String:PHAsset], contentsData: [String:Data], success: ((_ pickedResults: [String:PHPickerResult], _ selectedIdentifiers: [String], _ contentsData: [String:Data], _ contentMetaData: [String:PHAsset]) -> ())?, failure: (() -> ())?) {
        var index = index
        let count = selectedIdentifiers.count
        var contentsData = contentsData
        
        guard index < count else {
            DispatchQueue.main.async {
                success?(pickedResults, selectedIdentifiers, contentsData, contentsMetaData)
            }
            
            return
        }
        
        if pickerType == .image {
            if let itemProvider = (pickedResults[selectedIdentifiers[index]])?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    if let self = self, let image = image as? UIImage, let imageData = image.fixedOrientaion.jpegData(compressionQuality: 0.1) {
                        DispatchQueue.main.async {
                            contentsData.updateValue(imageData, forKey: selectedIdentifiers[index])
                            
                            index += 1
                            self.gatherDataFromPickedContents(index: index, pickerType: pickerType, pickedResults: pickedResults, selectedIdentifiers: selectedIdentifiers, contentsMetaData: contentsMetaData, contentsData: contentsData, success: success, failure: failure)
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            failure?()
                        }
                    }
                }
                
            } else if let itemProvider = (pickedResults[selectedIdentifiers[index]])?.itemProvider, itemProvider.hasItemConformingToTypeIdentifier(UTType.webP.identifier) {
                itemProvider.loadDataRepresentation(forTypeIdentifier: UTType.webP.identifier) { data, error in
                    if let data = data, let _ = UIImage(data: data) {
                        DispatchQueue.main.async {
                            contentsData.updateValue(data, forKey: selectedIdentifiers[index])
                            
                            index += 1
                            self.gatherDataFromPickedContents(index: index, pickerType: pickerType, pickedResults: pickedResults, selectedIdentifiers: selectedIdentifiers, contentsMetaData: contentsMetaData, contentsData: contentsData, success: success, failure: failure)
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            failure?()
                        }
                    }
                }
                
            } else {
                DispatchQueue.main.async {
                    failure?()
                }
            }
            
        }
    }
    
    // MARK: Permission
    func requestNotificationPermission(completionHandler: @escaping () -> ()) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow,Error in
            if didAllow {
                print("Push: 권한 허용")
                completionHandler()
            } else {
                print("Push: 권한 거부")
                completionHandler()
            }
        })
    }
    
    // MARK: UserDefaults Object 저장 및 불러오기
    // FIXME: 추후에 UserDefaults에 객체를 저장해야 하는 경우, 해당 메소드 활성화 및 사용.
//    func saveMemberInfoList(memberList: [[MemberDetailItem]]) {
//        let encoder: JSONEncoder = JSONEncoder()
//        if let memberInfo = try? encoder.encode(memberList) {
//            UserDefaults.standard.set(memberInfo, forKey: "SaveMemberInfo")
//            
//        }
//        
//    }
//    
//    func loadMemberInfoList() -> [MemberDetailItem] {
//        guard let memberInfo = UserDefaults.standard.object(forKey: "SaveMemberInfo") as? Data else { return [] }
//        
//        let decoder: JSONDecoder = JSONDecoder()
//        if let memberList = try? decoder.decode([MemberDetailItem].self, from: memberInfo) {
//            return memberList
//            
//        } else {
//            return []
//            
//        }
//    }
    
    // MARK: 전화번호 유효성 검사
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let regex = "^01[0-1, 7][0-9]{7,8}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = phonePredicate.evaluate(with: phoneNumber)
        
        return isValid
    }
}

// MARK: Date
extension Date {
    
}

extension CALayer {
    func useSketchShadow(color: UIColor, alpha: Float, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOpacity = alpha
        self.shadowOffset = CGSize(width: x, height: y)
        self.shadowRadius = blur / 2.0
        
        if spread == 0 {
            self.shadowPath = nil
            
        } else {
            let dx = -spread
            let rect = self.bounds.insetBy(dx: dx, dy: dx)
            self.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func useSketchShadow(color: UIColor, alpha: Float, shadowSize: CGFloat, viewSize: CGSize) {
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: viewSize.width + shadowSize,
                                                   height: viewSize.height + shadowSize))
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.shadowOpacity = alpha
        self.shadowPath = shadowPath.cgPath
    }
}

// MARK: UIFont
extension UIFont {
    enum PretendardFontType: String {
        case Black
        case Bold
        case ExtraBold
        case ExtraLight
        case Light
        case Medium
        case Regular
        case SemiBold
        case Thin
    }
    class func useFont(ofSize size: CGFloat, weight: PretendardFontType) -> UIFont {
        return UIFont(name: "PretendardVariable-\(weight.rawValue)", size: size)!
    }
}

// MARK: UITextField
extension UITextField {
    func setPlaceholder(placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            NSAttributedString.Key.foregroundColor:UIColor.useRGB(red: 148, green: 147, blue: 147),
            .font:UIFont.useFont(ofSize: 14, weight: .Regular)
        ])
    }
    
    func setBorder(imageName: String? = nil, color: UIColor? = nil) {
        self.borderStyle = .none
        self.layer.borderColor = color?.cgColor ?? UIColor.useRGB(red: 218, green: 218, blue: 218).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 12
        guard let imageName = imageName else {
            self.addLeftPadding()
            return
        }
        self.addLeftImageView(imageName: imageName)
    }
    
    func addLeftImageView(imageName: String) {
        let imageView = UIImageView()
        imageView.image = .useCustomImage(imageName)
        
        self.leftView = imageView
        self.leftViewMode = ViewMode.always
    }
    
    func addLeftPadding() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        
        self.leftView = view
        self.leftViewMode = ViewMode.always
    }
}

// MARK: UIColor to be possible to get color using 0 ~ 255 integer
extension UIColor {
    class func useRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / CGFloat(255), green: green / CGFloat(255), blue: blue / CGFloat(255), alpha: alpha)
    }
}

extension UIImage {
    var fixedOrientaion: UIImage {
        if self.imageOrientation == .up {
                return self
            }
        
            var transform: CGAffineTransform = CGAffineTransform.identity
            switch self.imageOrientation {
            case .down, .downMirrored:
                transform = transform.translatedBy(x: self.size.width, y: self.size.height)
                transform = transform.rotated(by: CGFloat(Double.pi))
                
            case .left, .leftMirrored:
                transform = transform.translatedBy(x: self.size.width, y: 0)
                transform = transform.rotated(by: CGFloat(Double.pi / 2))
                
            case .right, .rightMirrored:
                transform = transform.translatedBy(x: 0, y: self.size.height)
                transform = transform.rotated(by: CGFloat(-(Double.pi / 2)))
            default: // .up, .upMirrored
                break
            }

            switch self.imageOrientation {
            case .upMirrored, .downMirrored:
                //transform.translatedBy(x: self.size.width, y: 0)
                //transform.scaledBy(x: -1, y: 1)
                CGAffineTransformTranslate(transform, size.width, 0)
                CGAffineTransformScale(transform, -1, 1)
                
            case .leftMirrored, .rightMirrored:
                //transform.translatedBy(x: self.size.height, y: 0)
                //transform.scaledBy(x: -1, y: 1)
                CGAffineTransformTranslate(transform, size.height, 0)
                CGAffineTransformScale(transform, -1, 1)
                
            default: // .up, .down, .left, .right
                break
            }

            let ctx:CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: (self.cgImage)!.bitsPerComponent, bytesPerRow: 0, space: (self.cgImage)!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

            ctx.concatenate(transform)

            switch self.imageOrientation {
            case .left, .leftMirrored, .right, .rightMirrored:
                ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.height, height: self.size.width))
                
            default:
                ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            }

            let cgimg:CGImage = ctx.makeImage()!
            let img:UIImage = UIImage(cgImage: cgimg)

            return img
    }
    
    class func useCustomImage(_ name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage(systemName: "photo")!
    }
}

enum VerticalLocation {
    case bottom
    case top
    case left
    case right
}

extension UIView {
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.3, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 0.5), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -0.5), color: color, opacity: opacity, radius: radius)
        case .left:
            addShadow(offset: CGSize(width: -0.5, height: 0), color: color, opacity: opacity, radius: radius)
        case .right:
            addShadow(offset: CGSize(width: 0.5, height: 0), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 3.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func transfromToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
}

extension Int {
    func formatterStyle(_ numberStyle: NumberFormatter.Style) -> String? {
        let numberFommater: NumberFormatter = NumberFormatter()
        numberFommater.numberStyle = numberStyle
        return numberFommater.string(for: self)
    }
}

extension UILabel {
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
    
    func asFontColor(targetString: String, font: UIFont?, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
}


// MARK: - View Protocol
protocol EssentialViewMethods {
    func setViewFoundation()
    func initializeObjects()
    func setDelegates()
    func setGestures()
    func setNotificationCenters()
    func setSubviews()
    func setLayouts()
    func setViewAfterTransition()
}

// MARK: - Cell & Header Protocol
protocol EssentialCellHeaderMethods {
    func setViewFoundation()
    func initializeObjects()
    func setSubviews()
    func setLayouts()
}
