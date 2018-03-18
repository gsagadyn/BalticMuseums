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
    let icon = UIImageView()
	let blur = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
	weak var delegate: MapViewBarViewControllerDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)
		
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        addSubview(blur)
        blur.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        addSubview(icon)
        icon.image = UIImage(named: "experymentIcon")
        icon.contentMode = .scaleAspectFit
        icon.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
        }
		
		addSubview(label)
		label.snp.remakeConstraints { (make) in
			make.left.equalTo(icon.snp.right).offset(14)
			make.centerY.equalToSuperview()
		}
		
		addSubview(playButton)
		playButton.setImage(UIImage(named: "play"), for: UIControlState.normal)
		playButton.tintColor = UIColor(named: "main")
		playButton.isUserInteractionEnabled = false
		playButton.snp.remakeConstraints { (make) in
			make.left.equalTo(label.snp.right).offset(10)
			make.right.equalToSuperview().offset(-24)
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
