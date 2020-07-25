//
//  ViewController.swift
//  ILP-Extension
//
//  Created by Caroline Viana on 25/07/20.
//  Copyright © 2020 Caroline Viana. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SKView!
    
    @IBOutlet weak var bntPinclet: UIButton!
    
    
    var scene: creaturesScene?
    var runcount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bntPinclet.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scene = creaturesScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        
        self.sceneView.presentScene(scene)
    }
    
    @objc func clickButton(_ sender: UIButton){
        runcount = 0
        if let scene = self.scene {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                scene.animateCreature()
                self.runcount += 1
                
                if self.runcount >= 20{
                    timer.invalidate()
                    self.performSegue(withIdentifier: "ToDetails", sender: sender)
                    scene.removeAllChildren()
                }
                
            }
            timer.fire()
            
            
        }
    }


}

