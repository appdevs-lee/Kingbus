//
//  CustomizedTabBarController.swift
//  UniversalBora
//
//  Created by Awesomepia on 6/20/24.
//

import UIKit

class CustomizedTabBarController: UITabBarController {
    
    // 이전에 선택했던 탭
    var previousSelectedIndex: Int = 0
    
    // 현재 선택한 탭
    var currentSelectedIndex: Int = 0 {
        didSet {
            self.previousSelectedIndex = oldValue
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Tabbar Desgin
        self.setUpTabbar()
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.selectedViewController?.supportedInterfaceOrientations ?? .portrait) == .landscape ? .landscape : .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return (self.selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait) == .landscapeRight ? .landscapeRight : .portrait
    }
    
    deinit {
            print("----------------------------------- CustomizedTabBarController disposed -----------------------------------")
    }
}

// MARK: Extension for methods add
extension CustomizedTabBarController {
    func setUpTabbar() {
        self.delegate = self
        self.tabBar.layer.borderWidth = 0
        self.tabBar.layer.cornerRadius = 24
        self.tabBar.layer.borderColor = UIColor.useRGB(red: 241, green: 241, blue: 241).cgColor
        self.tabBar.layer.borderWidth = 1.0
        
        // FIXME: 스크롤 시, 탭바 변경되는 부분에 대해서 체크 필요함.
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        
        self.tabBar.tintColor = .useRGB(red: 46, green: 45, blue: 45)
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        
        // Set ViewControllers in Tabbar
        let mainVC = MainViewController()
        let myContractVC = MyContractViewController()
        let profileVC = ProfileViewController()
        
        self.viewControllers = [
            self.createTabBarItem(tabBarTitle: "견적", tabBarImage: "Main", selectedImage: "selectedMain", viewController: mainVC),
            self.createTabBarItem(tabBarTitle: "내 계약", tabBarImage: "MyContract", selectedImage: "selectedMyContract", viewController: myContractVC),
            self.createTabBarItem(tabBarTitle: "마이페이지", tabBarImage: "Profile", selectedImage: "selectedProfile", viewController: profileVC),
        ]
        
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, selectedImage: String, viewController: UIViewController) -> UINavigationController {
        let naviVC = CustomizedNavigationController(rootViewController: viewController)
        naviVC.tabBarItem.title = tabBarTitle
        naviVC.tabBarItem.setTitleTextAttributes([
            .foregroundColor: UIColor.useRGB(red: 196, green: 195, blue: 195),
            .font: UIFont.useFont(ofSize: 11, weight: .Regular)
        ], for: .normal)
        naviVC.tabBarItem.setTitleTextAttributes([
            .foregroundColor: UIColor.useRGB(red: 46, green: 45, blue: 45),
            .font: UIFont.useFont(ofSize: 11, weight: .Bold)
        ], for: .selected)
        naviVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        naviVC.tabBarItem.image = UIImage(named: tabBarImage)?.withRenderingMode(.alwaysOriginal)
        
        return naviVC
    }
    
}

extension CustomizedTabBarController {
    @objc func changeTextLanguage(_ notification: Notification) {
        for _ in self.tabBar.items! {
//            item.title = SupportingMethods.shared.getText("tabbar.home")
        }
    }
}

// MARK: Extension for UITabBarControllerDelegate
extension CustomizedTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.currentSelectedIndex = tabBarController.selectedIndex
        
        if tabBarController.selectedIndex == 0 {
            print("견적")
            
        }
        
        if tabBarController.selectedIndex == 1 {
            print("내 계약")
            
        }
        
        if tabBarController.selectedIndex == 2 {
            print("프로필")
            
        }
        
    }
    
}
