//
//  secondViewController.swift
//  ILP-Extension
//
//  Created by Caroline Viana on 25/07/20.
//  Copyright © 2020 Caroline Viana. All rights reserved.
//

import UIKit
import SpriteKit

class secondViewController: UIViewController {

    @IBOutlet weak var sceneView: SKView!
    var scene: creaturesScene?
    var choice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = self.scene{
            scene.clickAndFollow(choice)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scene = creaturesScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        
        self.sceneView.presentScene(scene)
        
        if let scene = self.scene{
            scene.clickAndFollow(choice)
        }
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            scene?.removeAllChildren()
        }
    }

}
