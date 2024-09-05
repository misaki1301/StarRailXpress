//
//  Coordinator.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 3/11/23.
//

import Foundation
import UIKit
import SwiftUI
import StarRailCharacters
import StarRailProfiler
import SkeletonTableRail
import StarRailCharactersSwiftUI

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
        mainVC.coordinator = self
        navController.setViewControllers([mainVC], animated: true)
        //navController.pushViewController(mainVC, animated: true)
    }
    
    private func showProfile() {
        let view = UIStoryboard(name: "TrailBlazerProfile", bundle: nil).instantiateViewController(withIdentifier: "trailblazerProfileViewController") as! TrailBlazerProfileViewController
        let interactor = TrailBlazerProfileInteractor()
        let router = TrailBlazerProfileRouter(coordinator: self)
        let presenter = TrailBlazerProfilePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        navController.pushViewController(view, animated: true)
    }
	
	private func showDonationsView() {
		let view = UIStoryboard(name: "DonationsView", bundle: nil).instantiateViewController(withIdentifier: "DonationsView") as! DonationsViewController
		navController.pushViewController(view, animated: true)
	}
    
    private func showCharacterDetail() {
        let view = UIStoryboard(name: "CharacterDetail", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetail") as! CharacterDetailViewController
        navController.pushViewController(view, animated: true)
    }
	private func showAchievements() {
		let hostController = UIHostingController(rootView: AchievementsView())
		navController.pushViewController(hostController, animated: true)
	}
	
	private func showCharacters() {
		let hostController = UIHostingController(rootView: CharacterListView())
		navController.pushViewController(hostController, animated: true)
	}
	
//	private func showCharacters() {
//		let coordina = ModuleCoordinator(navController: navController, window: window)
//		coordina.start()
//	}
	
	private func showProfiler() {
		let hostController = UIHostingController(rootView: TrailBlazerNewProfile())
		navController.pushViewController(hostController, animated: true)
	}
	
	private func showSkeleton() {
		let coordinator = SkeletonCoordinator(navController: navController, window: window)
		coordinator.start()
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
	func goToCharacters() {
		showCharacters()
	}
	
	func goToDonations() {
		print("XD2")
		showDonationsView()
	}
	
    func searchWithID(trailblazerID: String) {
        print(trailblazerID)
        showProfile()
    }
	
	func goToAchievements() {
		showAchievements()
	}
	
	func goToProfiler() {
		showProfiler()
	}
	
	func goToSkeleton() {
		showSkeleton()
	}
}

