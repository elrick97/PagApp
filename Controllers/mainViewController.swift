//
//  ViewController.swift
//  PagApp
//
//  Created by Ricardo Ramirez on 8/30/18.
//  Copyright © 2018 Ricardo Ramirez. All rights reserved.
//

import UIKit
import JTMaterialTransition
import ElasticTransition

class mainViewController: UIViewController {
    
    //buttonPay animations
    weak var presentControllerButton: UIButton?
    var transition: JTMaterialTransition?
    //elastic transition
    var elasticTransition = ElasticTransition()
    let lgr = UIScreenEdgePanGestureRecognizer()
    let rgr = UIScreenEdgePanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elasticTransitionCustomization()
        
        //button pay transition
        createPresentControllerButton()
        self.transition = JTMaterialTransition(animatedView: self.presentControllerButton!)
        
       gestureForElasticTransitionCustomization()
    }
    
    func gestureForElasticTransitionCustomization(){
        lgr.addTarget(self, action: #selector(mainViewController.handleLeftPan(_:)))
        rgr.addTarget(self, action: #selector(mainViewController.handleRightPan(_:)))
        
        lgr.edges = .left
        rgr.edges = .right
        view.addGestureRecognizer(lgr)
        view.addGestureRecognizer(rgr)
    }
    
    func elasticTransitionCustomization(){
        //transition customization
        elasticTransition.sticky = true
        elasticTransition.showShadow = true
        elasticTransition.panThreshold = 0.3
        elasticTransition.transformType = .translateMid
    }
    
    @objc func handleLeftPan(_ pan:UIPanGestureRecognizer){
        if pan.state == .began{
            elasticTransition.edge = .left
            elasticTransition.startInteractiveTransition(self, segueIdentifier: "toEvents", gestureRecognizer: pan)
            elasticTransition.startInteractiveTransition(self, segueIdentifier: "toEvents", gestureRecognizer: pan)
        }else{
            _ = elasticTransition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    @objc func handleRightPan(_ pan:UIPanGestureRecognizer){
        if pan.state == .began{
            elasticTransition.edge = .right
            elasticTransition.startInteractiveTransition(self, segueIdentifier: "toGroups", gestureRecognizer: pan)
        }else{
            _ = elasticTransition.updateInteractiveTransition(gestureRecognizer: pan)
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEvents" || segue.identifier == "toSettings" || segue.identifier == "toTransactionHistory" || segue.identifier == "toGroups" {
            let vc = segue.destination
            vc.transitioningDelegate = elasticTransition
            vc.modalPresentationStyle = .custom
        } else {
            let vc = segue.destination
            vc.transitioningDelegate = transition
            vc.modalPresentationStyle = .custom
        }
        
    }
}













