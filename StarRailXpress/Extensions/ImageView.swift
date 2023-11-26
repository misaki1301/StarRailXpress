//
//  ImageView.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 5/10/23.
//

import Foundation
import UIKit

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
