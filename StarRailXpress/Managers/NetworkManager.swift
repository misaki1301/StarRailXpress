//
//  NetworkManager.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 4/10/23.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()

	let baseUrl = "https://api.mihomo.me"
	
	static let assetBaseUrl = "https://cdn.jsdelivr.net/gh/Mar-7th/StarRailRes@master/"
	
	private init() {}
	
	func getDataByUserId (for uid: String, lang: Language) async throws -> PlayerResponse {
		let endpoint = "\(baseUrl)/sr_info_parsed/\(uid)?lang=\(lang.rawValue)"
		guard let url = URL(string: endpoint) else {
			throw NetworkError.invalidUrl
		}
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw NetworkError.invalidResponse
		}
		
		do {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			if let jsonString = String(data: data, encoding: .utf8) {
				print(jsonString)
			}
			return try decoder.decode(PlayerResponse.self, from: data)
		} catch {
			throw NetworkError.invalidData
		}
	}
}

enum NetworkError: Error {
	case invalidData
	case invalidResponse
	case invalidUrl
	case message(_ error: Error?)
}
