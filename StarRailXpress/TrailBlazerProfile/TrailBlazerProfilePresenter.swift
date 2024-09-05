//
//  TrailBlazerProfilePresenter.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 28/10/23.
//

import Foundation

protocol TrailBlazerUI: AnyObject {
	func update(profile: Player)
}

class TrailBlazerProfilePresenter {
	var model: Player?
    var view: TrailBlazerProfileViewController
    var interactor: TrailBlazerProfileInteractor
    var router: TrailBlazerProfileRouter
	
    init(view: TrailBlazerProfileViewController, interactor: TrailBlazerProfileInteractor, router: TrailBlazerProfileRouter) {
        self.interactor = interactor
        self.router = router
        self.view = view
	}
	
	func onViewAppear() {
		Task {
			let response = await interactor.getTrailBlazerProfile()
            //print(response.player)
            DispatchQueue.main.async {
                self.view.update(profile: response.player)
            }
		}
	}
}
