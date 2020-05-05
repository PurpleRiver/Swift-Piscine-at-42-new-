//
//  ViewController.swift
//  Stay Hydreted
//
//  Created by Blurry Rabbit on 02.05.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var index = 1
    private let particleEmitter = CAEmitterLayer()
    
    @IBOutlet weak var mainImageView: UIImageView! {
        didSet {
            self.mainImageView.image = UIImage(named: "bender1")
        }
    }
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var bottleImage1: UIImageView!
    @IBOutlet weak var bottleImage2: UIImageView!
    @IBOutlet weak var bottleImage3: UIImageView!
    @IBOutlet weak var bottleImage4: UIImageView!
    @IBOutlet weak var bottleImage5: UIImageView!
    @IBOutlet weak var bottleImage6: UIImageView!
    
    @IBAction func bottleButtonIsPressed(_ sender: UIButton) {
        if index <= 5 {
            paintABottle()
            mainImageView.image = UIImage(named: "bender\(index + 1)")
            index += 1
        } else {
            mainImageView.image = UIImage(named: "benderIsComplete")
            congratsLabel.isHidden = false
            paintABottle()
            createParticles()
            mainImageView.layer.addSublayer(particleEmitter)
        }
    }
    @IBAction func alarmButtonIsPressed(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func paintABottle() {
        switch index {
        case 1:
            bottleImage1.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        case 2:
            bottleImage2.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        case 3:
            bottleImage3.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        case 4:
            bottleImage4.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        case 5:
            bottleImage5.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        case 6:
            bottleImage6.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        default:
            print("There are nothing to be paint")
        }
    }
    
    private func createParticles() {
          particleEmitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
          particleEmitter.emitterShape = .line
          particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
          particleEmitter.renderMode = .additive
        
          let bender = createEmitterCell(velocity: 70, scale: 0.1, image: UIImage(named: "bender")?.cgImage ?? "default Image" as! CGImage)
          
          particleEmitter.emitterCells = [bender]
          
          mainImageView.layer.addSublayer(particleEmitter)
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

