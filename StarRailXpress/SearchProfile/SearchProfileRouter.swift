//
//  SearchProfileRouter.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 10/11/23.
//

import Foundation
import UIKit

class SearchProfileRouter {
    var window: UIWindow?
    
    func showSearchProfileController() {
        let view  = UIStoryboard(name: "SearchProfile", bundle: nil)
            .instantiateViewController(withIdentifier: "SearchProfileViewController") as!
        SearchProfileViewController
        
    }
}
