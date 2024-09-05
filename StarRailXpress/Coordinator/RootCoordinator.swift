//
//  RootCoordinator.swift
//  StarRailXpress
//
//  Created by Paul Frank on 30/12/23.
//

import Foundation
import UIKit
import SwiftUI

protocol ParentCoordinator: Coordinator {
	var childCoordinators: [Coordinator] {get set}
	func addChild(_ child: Coordinator?)
	func childDidFinish(_ child: Coordinator?)
}

final class RootCoordinator: Coordinator {
	
	private let tabController: UITabBarController
	private let window: UIWindow
	
	init(tabController: UITabBarController, window: UIWindow) {
		self.tabController = tabController
		self.window = window
	}
	
	func start() {
		window.rootViewController = tabController
		window.makeKeyAndVisible()
		print("Show root coordinator")
		showTabBar()
	}
	
	private func showTabBar() {
		let mainVC = UITabBarController()
		mainVC.viewControllers = []
	}
	
	
}


