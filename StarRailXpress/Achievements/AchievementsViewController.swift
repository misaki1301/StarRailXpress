//
//  AchievementsViewController.swift
//  StarRailXpress
//
//  Created by Paul Frank on 23/12/23.
//

import UIKit
import SwiftUI

class AchievementsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let achievementView = AchievementsView()
		let hostController = UIHostingController(rootView: achievementView)
		addChild(hostController)
		view.addSubview(hostController.view)
		hostController.didMove(toParent: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
