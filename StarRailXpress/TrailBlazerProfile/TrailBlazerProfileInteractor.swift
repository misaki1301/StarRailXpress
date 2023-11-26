//
//  TrailBlazerProfileInteractor.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 28/10/23.
//

import Foundation

class TrailBlazerProfileInteractor {
	
	func getTrailBlazerProfile() async -> PlayerResponse {
		let response = try! await NetworkManager.shared.getDataByUserId(for: "600274840", lang: .english)
		return response
	}
}
