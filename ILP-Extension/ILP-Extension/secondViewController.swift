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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = self.scene{
            scene.clickAndFollow()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scene = creaturesScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        
        self.sceneView.presentScene(scene)
        
        if let scene = self.scene{
            scene.clickAndFollow()
        }
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            // The back button was pressed or interactive gesture used
            scene?.removeAllChildren()
        }
    }

   // override var isMovingFromParent: Bool
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
