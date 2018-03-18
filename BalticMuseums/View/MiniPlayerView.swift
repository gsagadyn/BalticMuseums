//
//  MiniPlayerView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 18.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

protocol MiniPlayerViewDelegate: NSObjectProtocol {
	func didSelectBottomBar()
}

class MiniPlayerView: UIView {
	
	let label = UILabel()
	let playButton = UIButton()
	let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
	weak var delegate: MapViewBarViewControllerDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(blur)
		blur.snp.remakeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		addSubview(label)
		label.snp.remakeConstraints { (make) in
			make.left.equalToSuperview().offset(14)
			make.centerY.equalToSuperview()
		}
		
		addSubview(playButton)
		playButton.setImage(UIImage(named: "play"), for: UIControlState.normal)
		playButton.tintColor = UIColor(named: "main")
		playButton.isUserInteractionEnabled = false
		playButton.snp.remakeConstraints { (make) in
			make.left.equalTo(label.snp.right).offset(10)
			make.right.equalToSuperview().offset(-10)
			make.centerY.equalToSuperview()
		}
		
		let tapGesture = UITapGestureRecognizer()
		tapGesture.addTarget(self, action: #selector(handleTapGesture))
		addGestureRecognizer(tapGesture)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func handleTapGesture() {
		self.delegate?.didSelectBottomBar()
	}
	
}
