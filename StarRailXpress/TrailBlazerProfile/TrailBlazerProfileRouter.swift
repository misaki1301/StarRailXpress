//
//  TrailBlazerProfileRouter.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 28/10/23.
//

import Foundation
import UIKit

//each router has a coordinator injection via delegate
class TrailBlazerProfileRouter {
    
    var coordinator: Coordinator?
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
//	func showTrailBlazerProfile(window: UIWindow?) -> UIViewController {
//		let view = UIStoryboard(name: "TrailBlazerProfile", bundle: nil).instantiateViewController(withIdentifier: "trailblazerProfileViewController") as! TrailBlazerProfileViewController
//		let interactor = TrailBlazerProfileInteractor()
//		let presenter = TrailBlazerProfilePresenter(trailBlazerProfileInteractor: interactor)
//		presenter.ui = view
//		view.presenter = presenter
//		return view
//		//window?.rootViewController = view
//		//window?.makeKeyAndVisible()
//	}
    
    func showLoading() {
        let loadingView = LoadingModal()
        
    }
}
