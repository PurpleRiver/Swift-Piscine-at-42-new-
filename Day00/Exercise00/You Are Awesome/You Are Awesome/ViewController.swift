//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Blurry Rabbit on 30.04.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    
    @IBAction func greetButtonIsPressed(_ sender: UIButton) {
        helloLabel.isHidden = false
        print("Hello World!")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

