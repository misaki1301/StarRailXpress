//
//  SearchProfileViewController.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 5/11/23.
//

import UIKit

protocol SearchProfileViewControllerDelegate: AnyObject {
    func searchWithID(trailblazerID: String)
}

class SearchProfileViewController: UIViewController {
    
    @IBOutlet weak var searchLabel: UILabel!
    weak var delegate: SearchProfileViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("vista search")
        let tap = UITapGestureRecognizer(target: self, action: #selector(searchProfileTapped))
        searchLabel.isUserInteractionEnabled = true
        searchLabel.addGestureRecognizer(tap)
    }
    
    @objc
    func searchProfileTapped(_ sender: Any) {
        delegate?.searchWithID(trailblazerID: "600274840")
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
