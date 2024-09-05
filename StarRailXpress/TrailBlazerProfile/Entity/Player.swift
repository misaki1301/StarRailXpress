//
//  Player.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 4/10/23.
//

import Foundation

// usually each models from a VIPER perspective its called Entity so Player.swift must be called PlayerEntity.swift maybe?
struct Player: Codable {
	var uid: String
	var nickname: String
	var level: UInt
	var worldLevel: UInt
	var friendCount: UInt
	var avatar: Avatar
	var signature: String
	var isDisplay: Bool
	var spaceInfo: SpaceInfo
}

struct SpaceInfo: Codable {
	var memoryData: String?
	var challengeData: ChallengeData?
	var passAreaProgress: UInt
	var lightConeCount: UInt
	var avatarCount: UInt
	var achievementCount: UInt
}

struct ChallengeData: Codable {
	var mazeGroupId: UInt
	var mazeGroupIndex: UInt
	var preMazeGroupIndex: UInt
}

struct Avatar: Codable {
	var id: String
	var name: String
	var icon: String
}

struct PlayerResponse: Codable {
	var player: Player
	
	private enum CodingKeys: String, CodingKey {
		case player
	}
}
