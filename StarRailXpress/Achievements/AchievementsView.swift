//
//  AchievementsView.swift
//  StarRailXpress
//
//  Created by Paul Frank on 23/12/23.
//

import SwiftUI

struct AchievementsView: View {
	
	@State private var achievements: [AchievementValue]?
	
    var body: some View {
		GeometryReader { geo in
			ScrollView {
				LazyVStack {
					ForEach(achievements ?? [], id: \.self) {
						value in
						AchievementCard(title: value.title, description: value.description)
							.frame(width: geo.size.width)
					}
				}
			}
		}
		.onAppear {
			getAchievements()
		}

		.background(.gradientOne)
    }
	
	private func getAchievements() {
		Task {
			let achievements = try await NetworkManager.shared.getAchievements()
			self.achievements = Array(achievements.values.sorted(by: {$0.id > $1.id}))
			print(achievements)
		}
	}
}

#Preview {
    AchievementsView()
}

struct AchievementCard: View {
	var title: String
	var description: String
	var body: some View {
			VStack {
					HStack {
						Image("AchievementIcon")
								.renderingMode(.template)
								.resizable()
								.frame(width: 50, height: 50)
								.foregroundStyle(.black)
						VStack(alignment: .leading) {
							Text(title)
								.font(.subheadline)
								.fontWeight(.bold)
							Text(description)
								.font(.caption)
						}
					}
					.padding(12)
					.background {
						Color.white
					}.overlay {
						Rectangle()
							.stroke(Color.brown, lineWidth: 1.0)
							.cornerRadius(8, corners: [.topRight])
							.padding(4)
							

					}
				}
	}
}

#Preview {
	VStack {
		AchievementCard(title: "A 4-Star Rarity Daydream", description: "Have 0 or less Cosmic Fragment(s) when clearing Simulated Universe")
	}
}

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape( RoundedCorner(radius: radius, corners: corners) )
	}
}

struct RoundedCorner: Shape {
	
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
