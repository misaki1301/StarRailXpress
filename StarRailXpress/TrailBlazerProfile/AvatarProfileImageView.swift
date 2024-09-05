//
//  AvatarProfileImageView.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 21/11/23.
//

import SwiftUI

struct AvatarProfileImageView: View {
	var localeImage: String?
	var url = "\(NetworkManager.assetBaseUrl)icon/avatar/1006.png"
    var body: some View {
		VStack {
			ZStack {
				if let localeImage {
					Image(localeImage)
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
				} else {
					AsyncImage(url: URL(string: url)) { image in
						image.resizable()
                            .clipShape(Circle())
						
					} placeholder: {
						ProgressView()
					}
				}
			}.overlay {
				Circle().stroke(.gray, lineWidth: 2.0)
			}
        }
    }
}

struct AvatarProfileImageView_Preview: PreviewProvider {
	static var previews: some View {
		AvatarProfileImageView(localeImage: "minamisaki")
			.previewLayout(.fixed(width: 200, height: 200))

	}
}
