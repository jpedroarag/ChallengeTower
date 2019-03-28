//
//  PhysicsDetection.swift
//  Sprite
//
//  Created by Gustavo Portela Chaves on 22/02/19.
//  Copyright © 2019 Gustavo Portela Chaves. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

struct ColliderType2 {
    static let none: UInt32 = UInt32.min // collide with all
    static let player: UInt32 = 0x1 << 0 // 000000001 = 1
    static let ground: UInt32 = 0x1 << 1 // 000000010 = 2 // 000000100 = 4
    static let checkGround: UInt32 = 0x1 << 2
    static let all: UInt32 = UInt32.max // collide with all
}

class PhysicsDetection2: NSObject, SKPhysicsContactDelegate {
    //var player: CharacterNode?
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("bodyA:", contact.bodyA.node?.name ?? "nil", "bodyB: ", contact.bodyB.node?.name ?? "nil")
        
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //if the collision was between player and ground
        if collision == ColliderType.player | ColliderType.ground {
            
            if let player = contact.bodyA.node as? Player {
                player.landValues.grounded = true
            }else if let player = contact.bodyB.node as? Player{
                player.landValues.grounded = true
            }
            print("Chao")
            
        }
        if collision == ColliderType.player | ColliderType.player {
            print("collision between players")
        }
        if collision == ColliderType.checkGround | ColliderType.ground {
            print("collision between check")
        }
        
    }
    
    
    
}