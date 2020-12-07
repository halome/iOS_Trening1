//
//  UIView+Ext.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 01/12/2020.
//

import UIKit
import SnapKit

extension UIView {
    func pin() {
        snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
