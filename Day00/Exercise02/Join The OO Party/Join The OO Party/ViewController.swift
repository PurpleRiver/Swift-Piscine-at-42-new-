//
//  ViewController.swift
//  Join The OO Party
//
//  Created by Blurry Rabbit on 01.05.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let particleEmitter = CAEmitterLayer()
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var sceneView: UIView!
    
    @IBAction func startButtonIsTapped(_ sender: UIButton) {
        createParticles()
        sceneView.layer.addSublayer(particleEmitter)
    }
    @IBAction func stopButtonIsTapped(_ sender: UIButton) {
        particleEmitter.emitterCells = []
        greetingLabel.text = "Let's Go Already!"
    }
    
    private func createParticles() {
        
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        let snow = createEmitterCell(velocity: 32, scale: 0.03, image: UIImage(named: "snow")?.cgImage ?? "default Image" as! CGImage)
        let star = createEmitterCell(velocity: 45, scale: 0.05, image: UIImage(named: "star")?.cgImage ?? "default Image" as! CGImage)
        let bender = createEmitterCell(velocity: 70, scale: 0.1, image: UIImage(named: "bender")?.cgImage ?? "default Image" as! CGImage)
        
        particleEmitter.emitterCells = [snow, star, bender]
        
        sceneView.layer.addSublayer(particleEmitter)
    }
    
    private func createEmitterCell(velocity: CGFloat, scale: CGFloat, image: CGImage) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 1
        cell.lifetime = 25.0
        cell.velocity = velocity
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi/8
        cell.scale = scale
        cell.contents = image
        
        return cell
    }
}

