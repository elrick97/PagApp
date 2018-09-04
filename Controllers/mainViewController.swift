//
//  ViewController.swift
//  PagApp
//
//  Created by Ricardo Ramirez on 8/30/18.
//  Copyright © 2018 Ricardo Ramirez. All rights reserved.
//

import UIKit
import JTMaterialTransition

class ViewController: UIViewController {
    
    weak var presentControllerButton: UIButton?
    var transition: JTMaterialTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPresentControllerButton()
        self.transition = JTMaterialTransition(animatedView: self.presentControllerButton!)
    }
    
    func createPresentControllerButton () {
        
        /*
         Pay button
         */
        let payButtonWidth: CGFloat = 100
        let payButtonHeight: CGFloat = payButtonWidth
        let payButtonX: CGFloat = (self.view.frame.width - payButtonWidth) / 2.0
        let PayButtonY: CGFloat = (self.view.frame.height - payButtonHeight) / 2.0
        
        let presentControllerButton = UIButton(frame: CGRect(x: payButtonX, y: PayButtonY, width: payButtonWidth, height: payButtonHeight))
        presentControllerButton.layer.cornerRadius = payButtonWidth / 2.0
        presentControllerButton.backgroundColor = UIColor(displayP3Red: 118.0 / 256.0, green: 213.0 / 256.0, blue: 122 / 256.0, alpha: 1.0)
        
        presentControllerButton.setTitle("Pay!", for: .normal)
        presentControllerButton.addTarget(self, action: #selector(didPresentControllerButtonTouch), for: .touchUpInside)
        
        self.view.addSubview(presentControllerButton)
        self.presentControllerButton = presentControllerButton
        
    }
    
    @objc func didPresentControllerButtonTouch () {
        let controller = payViewController()
        
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition
        
        self.present(controller, animated: true, completion: nil)
    }
    

}













