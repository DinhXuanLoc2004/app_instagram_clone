//
//  PassThroughTapView.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit

class PassThroughTapView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }

}
