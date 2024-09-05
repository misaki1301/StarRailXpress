//
//  NetworkManager.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 4/10/23.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()

	let baseUrl = "api.mihomo.me"
	
	static let assetBaseUrl = "https://cdn.jsdelivr.net/gh/Mar-7th/StarRailRes@master/"
	
	private init() {}
	
	enum Endpoints {
		static let userInfo = "/sr_info_parsed/"
		static let achievements = "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/achievements.json"
		static let characters = "https://raw.githubusercontent.com/Mar-7th/StarRailRes/bbe4da36a0e17410267c4dc53ada41716dee813f/index_new/en/characters.json"
	}
	
	func getAchievements() async throws -> Achievement {
		guard let url = URL(string: Endpoints.achievements) else {
			throw NetworkError.invalidUrl
		}
		let (data, response) = try await URLSession.shared.data(from: url)
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw NetworkError.invalidResponse
		}
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(Achievement.self, from: data)
		} catch {
			throw NetworkError.invalidData
		}
	}
	
	func fetchData() async throws -> (Bool, Data?) {
		let url = URL(string: "")!
		let (data, response) =  try await URLSession.shared.data(from: url)
		return (true, data)
	}
	
	func getDataByUserId (for uid: String, lang: Language) async throws -> PlayerResponse {
		var components = URLComponents()
		components.scheme = "https"
		components.host = baseUrl
		components.path = Endpoints.userInfo + uid
		
		components.queryItems = [
			URLQueryItem(name: "lang", value: lang.rawValue)
		]
		guard let url = components.url else {
			throw NetworkError.invalidUrl
		}
		
		
//		let endpoint = "\(baseUrl)/sr_info_parsed/\(uid)?lang=\(lang.rawValue)"
//		guard let url = URL(string: endpoint) else {
//			throw NetworkError.invalidUrl
//		}
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
