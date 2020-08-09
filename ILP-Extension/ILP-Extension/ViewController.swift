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
    @IBOutlet weak var bntHavyion: UIButton!
    @IBOutlet weak var bntGlixino: UIButton!
    @IBOutlet weak var bntiEye: UIButton!
    
    
    var scene: creaturesScene?
    var runcount = 0
    var clicked = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bntPinclet.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        bntHavyion.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        bntGlixino.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        bntiEye.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        bntPinclet.layer.borderWidth = 1
        bntPinclet.layer.cornerRadius = 20
        bntHavyion.layer.borderWidth = 1
        bntHavyion.layer.cornerRadius = 20
        bntGlixino.layer.borderWidth = 1
        bntGlixino.layer.cornerRadius = 20
        bntiEye.layer.borderWidth = 1
        bntiEye.layer.cornerRadius = 20
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scene = creaturesScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        
        self.sceneView.presentScene(scene)
    }
    
    @objc func clickButton(_ sender: UIButton){
        self.clicked = sender.restorationIdentifier!
        runcount = 0
        bntPinclet.isHidden = true
        bntHavyion.isHidden = true
        bntGlixino.isHidden = true
        bntiEye.isHidden = true
        
        switch self.clicked {
        case "Pinclet":
            bntPinclet.isHidden = false
            break
        case "Havyion":
            bntHavyion.isHidden = false
            break
        case "Glixino":
            bntGlixino.isHidden = false
            break
        case "iEye":
            bntiEye.isHidden = false
            break
        default:
            break
        }
        
        
        if let scene = self.scene {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                scene.animateCreature(self.clicked)
                self.runcount += 1
                
                if self.runcount >= 20{
                    timer.invalidate()
                    self.performSegue(withIdentifier: "ToDetails", sender: sender)
                    self.bntPinclet.isHidden = false
                    self.bntHavyion.isHidden = false
                    self.bntGlixino.isHidden = false
                    self.bntiEye.isHidden = false
                    scene.removeAllChildren()
                }
                
            }
            timer.fire()
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! secondViewController
        vc.choice = clicked
    }


}

