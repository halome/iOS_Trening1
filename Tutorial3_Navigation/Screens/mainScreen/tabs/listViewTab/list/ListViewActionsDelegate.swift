//
//  ListViewActionsDelegate.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 07/12/2020.
//

import UIKit

protocol ListViewCellActionsDelegate: NSObjectProtocol {
    func rowItemSelected(row: Int, item: Int)
}
