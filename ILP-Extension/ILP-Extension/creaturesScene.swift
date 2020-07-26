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
    
    let pincletFrames = [SKTexture(imageNamed: "pinclet"), SKTexture(imageNamed: "PinclFrame")]
    let iEyeFrames = [SKTexture(imageNamed: "iEye"), SKTexture(imageNamed: "iEye1"), SKTexture(imageNamed: "iEye2"), SKTexture(imageNamed: "iEye3"), SKTexture(imageNamed: "iEye2"), SKTexture(imageNamed: "iEye1"), SKTexture(imageNamed: "iEye")]
    let havyionFrames = [SKTexture(imageNamed: "havyion"), SKTexture(imageNamed: "HavFrame")]
    let glixinoFrames = [SKTexture(imageNamed: "glixino"), SKTexture(imageNamed: "Glix1"), SKTexture(imageNamed: "Glix2")]
    
    var framesUsed:[SKTexture]?
    var touchLocal = CGPoint(x: 0, y: 0)
    var localNow: CGPoint!
    var aux = ""
    var didSet = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .white
        framesUsed = [SKTexture(imageNamed: "havyion"), SKTexture(imageNamed: "HavFrame")]
        touchLocal = CGPoint(x: frame.midX, y: frame.midY)
    }
    
    func animateCreature(_ creature: String){
        switch creature {
        case "Pinclet":
            framesUsed = pincletFrames
            break
        case "Havyion":
            framesUsed = havyionFrames
            break
        case "Glixino":
            framesUsed = glixinoFrames
            break
        case "iEye":
            framesUsed = iEyeFrames
            break
        default:
            break
        }
        
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
    
    func clickAndFollow(_ creatureNow: String){
        switch creatureNow {
        case "Pinclet":
            framesUsed = pincletFrames
            break
        case "Havyion":
            framesUsed = havyionFrames
            break
        case "Glixino":
            framesUsed = glixinoFrames
            break
        case "iEye":
            framesUsed = iEyeFrames
            break
        default:
            break
        }
        aux = creatureNow
        let firstTex = self.framesUsed![0]
        let creature = SKSpriteNode(texture: firstTex)
        creature.position = CGPoint(x: frame.midX, y: frame.midY)
        creature.name = "creature"
        self.addChild(creature)
        
        switch creatureNow {
               case "Pinclet":
                    let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
                    creature.run(SKAction.repeatForever(animation))
                   break
               case "Havyion":
                   let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
                   creature.run(SKAction.repeatForever(animation))
                   break
               case "Glixino":
                   let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
                   creature.run(SKAction.repeatForever(animation))
                   break
               case "iEye":
                    let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
                   let wait = SKAction.wait(forDuration: 4)
                    let sequence = SKAction.sequence([wait, animation])
                   creature.run(SKAction.repeatForever(sequence))
                   break
               default:
                   break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        touchLocal = touch.location(in: self)
        
        if aux != "iEye" {
            let animation = SKAction.animate(with: framesUsed!, timePerFrame: 0.1)
            childNode(withName: "creature")?.run(SKAction.repeatForever(animation))
        }
        didSet = true
        childNode(withName: "creature")?.run(SKAction.move(to: touchLocal, duration: 5))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        let newTouch = Int(touchLocal.y)
        let nodePosition = Int(childNode(withName: "creature")?.position.y ?? 0)
        
        switch aux {
               case "Pinclet":
                    if nodePosition == newTouch {
                        if didSet{
                            childNode(withName: "creature")?.removeAllActions()
                            didSet = false
                        }
                    }
                    break
               case "Glixino":
                    if nodePosition == newTouch {
                        if didSet{
                            childNode(withName: "creature")?.removeAllActions()
                            didSet = false
                        }
                    }
                    break
               default:
                    break
        }
    }
    
    
    
    

}
