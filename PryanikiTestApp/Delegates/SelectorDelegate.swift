//
//  SelectorDelegate.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/10/21.
//

import UIKit

protocol SelectorDelegate {
    func segmentTapped(from selector: UISegmentedControl, to label: UILabel)
}
