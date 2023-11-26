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
	
	var ui: TrailBlazerUI?
	var model: Player?
	
	private let trailBlazerProfileInteractor: TrailBlazerProfileInteractor
	
	init(trailBlazerProfileInteractor: TrailBlazerProfileInteractor) {
		self.trailBlazerProfileInteractor = trailBlazerProfileInteractor
	}
	
	func onViewAppear() {
		Task {
			let response = await trailBlazerProfileInteractor.getTrailBlazerProfile()
            print(response.player)
            DispatchQueue.main.async {
                self.ui?.update(profile: response.player)
            }
		}
	}
}
