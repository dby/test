//
//  BaseNavController.swift
//  iMovie
//
//  Created by sys on 2016/12/8.
//  Copyright © 2016年 sys. All rights reserved.
//

import Foundation

class BaseNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.delegate = self
            delegate = self
        }
        self.isNavigationBarHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            UIApplication.shared.statusBarStyle = .default
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        if self.viewControllers.count == 2 {
            UIApplication.shared.statusBarStyle = .lightContent
        }
        return super.popViewController(animated: animated)
    }
}

extension BaseNavController: UIGestureRecognizerDelegate {
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) && animated {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        
        return super.popToRootViewController(animated: animated)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) && animated {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        
        return super.popToViewController(viewController, animated: false)
    }
}

extension BaseNavController: UINavigationControllerDelegate {
    //MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = true
        }
    }
}
