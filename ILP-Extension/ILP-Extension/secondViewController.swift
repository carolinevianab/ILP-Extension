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
    @IBOutlet weak var lblCreatureName: UILabel!
    @IBOutlet weak var lblCreatureAbout: UILabel!
    var scene: creaturesScene?
    var choice = ""
    
    let pincletText = """
    Nome: Pinclet
    Tamanho: Até 60 centímetros mais o tamanho das orelhas, que podem chegar a 25 centimetros
    Alimentação: Herbívoro, frutas de Vatras e de árvores Jarr
    Resistencia: Gelo e frio
    Comportamento: Pacífico, amigável e curioso
    Ataque: Ele não ataca, mas se torna hostil se atacado
    Defesa: É coberto por uma substância desconhecida extremamente venenosa, que pode penetrar qualquer tecido sintético ou organico apenas por contato
    """
    
    let glixinoText = """
    Nome: Glixino
    Tamanho: Até 1,50 metros de altura
    Alimentação: Carnívoro, geralmente Havyions e iEyes Evaporados
    Resistencia: Nenhuma
    Comportamento: Agressivo
    Ataque: Ataca rapidamente avançando em sua presa
    Defesa: sua pele é grossa, e o protege de ataques como mordidas e ferroadas


    """
    
    let havyionText = """
    Nome: Havyion
    Tamanho: entre 1 e 1,60 metros do bico a cauda
    Alimentação: Onivoro, geralmente frutas de árvores Jarr e folhas de Ayezi
    Resistencia: Nenhuma
    Comportamento: Geralmente pacífico, porém terriorial, e ataca invasores
    Ataque: Usa seu bico para rasgar tecidos e folhas, e usa sua cauda como distração
    Defesa: Pode voar rapidamente para se afastar da presa
    """
    
    let iEyeText = """
    Nome: iEye
    Tamanho: entre 30 centimetros e 1 metro quando esticado
    Alimentação: se alimenta a partir de sais minerais presentes no solo
    Resistencia: Fogo
    Comportamento: Pacífico
    Ataque: iEyes não atacam
    Defesa: Seu corpo possui uma grande camada de ácido altamente corrosivo para tecidos organicos.
    """
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = choice
        if let scene = self.scene{
            scene.clickAndFollow(choice)
        }
        
        
        self.scene = creaturesScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        
        self.sceneView.presentScene(scene)
        
        if let scene = self.scene{
            scene.clickAndFollow(choice)
        }
        
        lblCreatureName.text = choice
        
        switch choice {
        case "Pinclet":
            lblCreatureAbout.text = pincletText
            break
        case "Havyion":
            lblCreatureAbout.text = havyionText
            break
        case "Glixino":
            lblCreatureAbout.text = glixinoText
            break
        case "iEye":
            lblCreatureAbout.text = iEyeText
            break
        default:
            break
        }
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            scene?.removeAllChildren()
        }
    }
    

}
