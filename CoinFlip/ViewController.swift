//
//  ViewController.swift
//  CoinFlip
//
//  Created by Steph Grosch on 1/2/21.
//  Copyright © 2021 Steph Grosch. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coinButtonAction(_ sender: Any) {
        //flip the coin on click / true = heads, false = tails
        let status = Bool.random()
        
        if status {
            //true = heads
            
            //set button image
            coinButton.setImage(UIImage(named: "heads"), for: .normal)
            
            //set label text
            statusLabel.text = "Heads"
        } else {
            //false = tails
            
            //set button image
            coinButton.setImage(UIImage(named: "tails"), for: .normal)
            
            //set label text
            statusLabel.text = "Tails"
        }
        
        //add animation
        //UIView.transition(with: coinButton, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        doAnimationCoin(coinButton)
    }
    
    //advanced coin animation
    func doAnimationCoin(_ button:UIButton) {
        let coinFlip = CATransition()
        coinFlip.startProgress = 0.0
        coinFlip.endProgress = 1.0
        coinFlip.type = CATransitionType(rawValue: "flip")
        coinFlip.subtype = CATransitionSubtype(rawValue: "fromLeft")
        coinFlip.duration = 0.1
        coinFlip.repeatCount = 7
        button.layer.add(coinFlip, forKey: "transition")
    }
    
    
    class ViewController: UIViewController {
        
        private let skView = SKView()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupUI()
            initSkScene()
        }

        private func setupUI() {
            self.view.backgroundColor = .black
            
            view.addSubview(skView)
            
            skView.translatesAutoresizingMaskIntoConstraints = false
            
            let top = skView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
            let leading = skView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            let trailing = skView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            let bottom = skView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
            NSLayoutConstraint.activate([top, leading, trailing, bottom])
        }
        private func initSkScene() {
            let particleScene = particlescene(size: CGSize(width: 1080, height: 1920))
            particleScene.scaleMode = .aspectFill
            particleScene.backgroundColor = .clear
            
            skView.presentScene(particleScene)
    }

    }

}

