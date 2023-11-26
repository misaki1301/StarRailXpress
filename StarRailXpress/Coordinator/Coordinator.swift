//
//  Coordinator.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 3/11/23.
//

import Foundation
import UIKit

public protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    private let navController: UINavigationController
    private let window: UIWindow
    
    //MARK: - Initializers
    init(navController: UINavigationController, window: UIWindow) {
        self.navController = navController
        self.window = window
    }
    
    func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        print("START COORDINATOR")
        showMain()
    }
    
    private func showMain() {
        let mainVC = UIStoryboard(name: "SearchProfile", bundle: nil)
            .instantiateViewController(withIdentifier: "searchProfileViewController") as! SearchProfileViewController
        mainVC.delegate = self
        navController.setViewControllers([mainVC], animated: true)
        //navController.pushViewController(mainVC, animated: true)
    }
    
    private func showProfile() {
        //let profileVC = UIStoryboard(name: "TrailBlazerProfile", bundle: nil).instantiateViewController(withIdentifier: "trailblazerProfileViewController") as! TrailBlazerProfileViewController
        //profileVC.delegate = self
        //navController.setViewControllers([profileVC], animated: true)
            let router = TrailBlazerProfileRouter()
        let vc = router.showTrailBlazerProfile(window: window)
        navController.setViewControllers([vc], animated: true)
        
        
    }
}

// MARK: - TrailBlazerProfileViewControllerDelegate
extension AppCoordinator: TrailBlazerProfileViewControllerDelegate {
    func navigateToNextPage() {
        print("XD")
    }
}

// MARK: - SearchProfileViewControllerDelegate
extension AppCoordinator: SearchProfileViewControllerDelegate {
    func searchWithID(trailblazerID: String) {
        print(trailblazerID)
        showProfile()
    }
}


