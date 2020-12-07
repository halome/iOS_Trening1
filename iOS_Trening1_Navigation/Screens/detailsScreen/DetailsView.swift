//
//  TestView.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 07/12/2020.
//

import UIKit
import AVKit

class DetailsView: UIView {
    let playButton: UIButton = {
        let title = "PLAY"
        let uiButton = UIButton()
        uiButton.setTitle(title, for: .normal)
        uiButton.backgroundColor = .systemBlue
        uiButton.setTitleColor(.black, for: .normal)
        uiButton.layer.cornerRadius = 8.0
        return uiButton
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .top
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    let firstHalf: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    let secondHalf: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        prepareStackView()
        preparePlayerButtons()
    }
    
    public func updateButtons(state: PlayerState) {
        self.playButton.setTitle(state == .play ? "PAUSE" : "PLAY", for: .normal)
    }
    
    private func prepareStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
        
        stackView.addArrangedSubview(firstHalf)
        stackView.addArrangedSubview(secondHalf)
        
        firstHalf.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
        }
        secondHalf.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
        }
    }
    
    private func preparePlayerButtons() {
        secondHalf.addSubview(playButton)
        playButton.frame = secondHalf.frame
        playButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
