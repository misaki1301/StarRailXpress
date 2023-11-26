//
//  TrailBlazerProfileView.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 28/10/23.
//

import Foundation
import UIKit
import SwiftUI

public protocol TrailBlazerProfileViewControllerDelegate: AnyObject {
    func navigateToNextPage()
}

class TrailBlazerProfileViewController: UIViewController {
	//@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var trailblazeLevelLabel: UILabel!
	@IBOutlet weak var equilibriumLevelLabel: UILabel!
	@IBOutlet weak var charactersOwnedLabel: UILabel!
	@IBOutlet weak var achievementsUnlockedLabel: UILabel!
    @IBOutlet var viewContainer: UIView!
    
    var presenter: TrailBlazerProfilePresenter?
    
    public weak var delegate: TrailBlazerProfileViewControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//view.backgroundColor = .blue
        print("Trailblazer Profile loaded?")
		let vc = UIHostingController(rootView: AvatarProfileImageView())
		let avatarView = vc.view!
		presenter?.onViewAppear()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		//setupGradientBackground()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		setupGradientBackground()
		super.viewWillAppear(animated)
	}
	
	func setupGradientBackground() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = view.bounds
		gradientLayer.colors = [
			UIColor(named: "gradientOne")!.cgColor,
			UIColor(named: "gradientTwo")!.cgColor,
			UIColor(named: "gradientThree")!.cgColor
		]
		view.layer.insertSublayer(gradientLayer, at: 0)
	}
}

extension TrailBlazerProfileViewController: TrailBlazerUI {
	func update(profile: Player) {
		usernameLabel.text = profile.nickname
		trailblazeLevelLabel.text = "\(profile.level)"
		equilibriumLevelLabel.text = "\(profile.worldLevel)"
		charactersOwnedLabel.text = "\(profile.spaceInfo.avatarCount)"
		achievementsUnlockedLabel.text = "\(profile.spaceInfo.achievementCount)"
        //avatarImageView.kf.setImage(with: URL(string: NetworkManager.assetBaseUrl+"\(profile.avatar.icon)"))
	}
}
