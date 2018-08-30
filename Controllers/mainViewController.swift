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
        
        let width: CGFloat = 100
        let height: CGFloat = width
        let x: CGFloat = (self.view.frame.width - width) / 2.0
         let y: CGFloat = (self.view.frame.height - height) / 2.0
        
        let presentControllerButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        presentControllerButton.layer.cornerRadius = width / 2.0
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


