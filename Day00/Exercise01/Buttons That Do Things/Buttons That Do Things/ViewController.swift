//
//  ViewController.swift
//  Buttons That Do Things
//
//  Created by Blurry Rabbit on 01.05.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!

    @IBAction func firstButtonIsTapped(_ sender: UIButton) {
        presentNameOfFont(name: sender.titleLabel?.text ?? "Some New Font")
        greetingLabel.font = UIFont.init(name: "Futura", size: 75)
        self.view.backgroundColor = .orange
        greetingLabel.textColor = .white
    }
    @IBAction func secondButtonIsTapped(_ sender: UIButton) {
        presentNameOfFont(name: sender.titleLabel?.text ?? "Some New Font")
        greetingLabel.font = UIFont.init(name: "Helvetica", size: 75)
        self.view.backgroundColor = .brown
        greetingLabel.textColor = .white
    }

    private func presentNameOfFont(name: String) {
        let alertController = UIAlertController(title: "Look it's a new font!", message: "We can change a font for our label. Current font is \(name.capitalized)!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
}

