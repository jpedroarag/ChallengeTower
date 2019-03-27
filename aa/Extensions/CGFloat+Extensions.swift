//
//  CGFloat+.swift
//  Sprite
//
//  Created by Gustavo Portela Chaves on 26/02/19.
//  Copyright © 2019 Gustavo Portela Chaves. All rights reserved.
//

import Foundation
import SpriteKit

public extension CGFloat{
    static var degreesToRadians: CGFloat{
        return CGFloat.pi / 180
    }
    static var radiansToDegrees: CGFloat{
        return 180 / CGFloat.pi
    }
    
    static var zero: CGFloat{
        return CGFloat(integerLiteral: 0)
    }
    static public func clamp(_ value: CGFloat, lower: CGFloat, upper: CGFloat) -> CGFloat {
        return Swift.min(Swift.max(lower, value), upper)
    }
}


