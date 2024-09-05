//
//  Achievement.swift
//  StarRailXpress
//
//  Created by Paul Frank on 23/12/23.
//

import Foundation

struct AchievementValue: Codable, Hashable {
	var id: String
	var seriesId: String
	var title: String
	var description: String
	var hideDescription: String
	var isHidden: Bool
	
	private enum CodingKeys: String, CodingKey {
		case id
		case seriesId = "series_id"
		case title
		case description = "desc"
		case hideDescription = "hide_desc"
		case isHidden = "hide"
	}
	
}

typealias Achievement = [String: AchievementValue]
