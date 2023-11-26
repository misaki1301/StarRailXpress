//
//  AvatarProfileViewController.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 21/11/23.
//

import UIKit
import SwiftUI

class AvatarProfileViewController: UIHostingController<AvatarProfileImageView> {

	required init?(coder aDecoder:NSCoder) {
		super.init(coder: aDecoder, rootView: AvatarProfileImageView())
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
