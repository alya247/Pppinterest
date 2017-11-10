//
//  Style.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct Style {
    
    static func roundCorners(_ round: CGFloat) -> Decoration<UIView> {
        return { [round] (view: UIView) -> Void in
            view.layer.cornerRadius = round
        }
    }
}
