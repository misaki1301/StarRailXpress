//
//  LoadingModal.swift
//  StarRailXpress
//
//  Created by Paul Frank Pacheco Carpio on 13/10/23.
//

import UIKit
import Kingfisher

class LoadingModal: UIView {

	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var customView: UIView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	/*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	private func commonInit() {
		let xibView = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as! UIView
		
		xibView.frame = self.bounds
		addSubview(xibView)
		
		//customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		print("Loading modal...")
		//let resource: Resource? = nil
		//image.kf.setImage(with: resource)
		//image.image = UIImage(named: "herta-kurukuru")
	}

}
