//
//  SplashViewController.swift
//  Kingbus
//
//  Created by 이주성 on 12/19/24.
//

import UIKit

final class SplashViewController: UIViewController {
    

    
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
        print("----------------------------------- SplashViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension SplashViewController: EssentialViewMethods {
    func setViewFoundation() {
        ReferenceValues.firstVC = self
        
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
            self.splashStackView,
        ], to: self.view)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        

        
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
        
    }
}

// MARK: - Extension for methods added
extension SplashViewController {
    
}

// MARK: - Extension for selector methods
extension SplashViewController {
    
}
