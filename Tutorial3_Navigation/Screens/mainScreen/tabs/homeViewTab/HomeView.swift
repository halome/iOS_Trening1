//
//  FirstTabView.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 02/12/2020.
//

import UIKit
import SnapKit

class HomeView : UIView {
    weak var delegate: HomeViewActionsDelegate?
    
    let firstButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("press me", for: .normal)
        uiButton.backgroundColor = .systemBlue
        uiButton.setTitleColor(.black, for: .normal)
        uiButton.layer.cornerRadius = 8.0
        return uiButton
    }()
    
    init(tabBarHeight: CGFloat) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        prepareButton(tabBarHeight: tabBarHeight)
    }
    
    func prepareButton(tabBarHeight: CGFloat) {
        addSubview(firstButton)
        firstButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview()
            maker.bottom.equalTo(-(tabBarHeight))
            maker.width.height.equalTo(200.0)
        }
        firstButton.addTarget(self, action: #selector(onFirstButtonPress), for: .touchUpInside)
    }
    
    @objc func onFirstButtonPress() {
        delegate?.homeViewOnFirstButtonPress(firstButton: firstButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
