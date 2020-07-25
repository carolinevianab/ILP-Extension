//
//  creaturesScene.swift
//  ILP-Extension
//
//  Created by Caroline Viana on 25/07/20.
//  Copyright © 2020 Caroline Viana. All rights reserved.
//

import UIKit
import SpriteKit

class creaturesScene: SKScene {
    var framesUsed:[SKTexture]?
    var touchLocal = CGPoint(x: 0, y: 0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .white
        framesUsed = [SKTexture(imageNamed: "havyion"), SKTexture(imageNamed: "HavFrame")]
    }
    
    func animateCreature(){
        let firstTex = self.framesUsed![0]
        let creature = SKSpriteNode(texture: firstTex)
        
        let randonY = Int.random(in: 0...Int(self.frame.height - 100))
        
        creature.position = CGPoint(x: Int(self.frame.maxX + 50), y: randonY)
        
        self.addChild(creature)
        
        
        let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
        let remove = SKAction.run {
            creature.removeAllActions()
            creature.removeFromParent()
        }
        let move = SKAction.moveTo(x: self.frame.minX - 50, duration: 3)
        let sequence = SKAction.sequence([move, remove])
        
        creature.run(SKAction.repeatForever(animation))
        creature.run(sequence)
    }
    
    func clickAndFollow(){
        self.backgroundColor = .clear
        let firstTex = self.framesUsed![0]
        let creature = SKSpriteNode(texture: firstTex)
        
        creature.position = CGPoint(x: 0, y: 0)
        creature.name = "creature"
        
        self.addChild(creature)
        
        
        let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
        creature.run(SKAction.repeatForever(animation))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        touchLocal = touch.location(in: self)
    }
    
    override func update(_ currentTime: TimeInterval) {
        childNode(withName: "creature")?.run(SKAction.move(to: touchLocal, duration: 5))
    }
    
    
    
    
}
