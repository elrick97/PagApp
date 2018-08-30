//
//  payViewController.swift
//  PagApp
//
//  Created by Ricardo Ramirez on 8/30/18.
//  Copyright © 2018 Ricardo Ramirez. All rights reserved.
//

import UIKit

class payViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(displayP3Red: 118.0 / 256.0, green: 213.0 / 256.0, blue: 122 / 256.0, alpha: 1.0)
        createElements()
    }
    
    @objc func didCloseButtonTouch () {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createElements() {
        /*
         Label transfer money
         */
        let payLabelY: CGFloat = 60
        let payLabelWidth: CGFloat = 120
        let payLabelHeight: CGFloat = 17
        let payLabelX: CGFloat = view.frame.width / 2 - payLabelWidth / 2
        
        let payLabel = UILabel(frame: CGRect(x: payLabelX, y: payLabelY, width: payLabelWidth, height: payLabelHeight))
        
        payLabel.text = "Transfer Money"
        payLabel.textColor = UIColor.white
        
        
        self.view.addSubview(payLabel)
        
        /*
         Button close
         */
        let closeButtonY: CGFloat = 15
        let closeButtonWidth: CGFloat = 50.0
        let closeButtonHeight: CGFloat = closeButtonWidth
        let closeButtonX: CGFloat = 0
        
        let closeButton = UIButton(frame: CGRect(x: closeButtonX, y: closeButtonY, width: closeButtonWidth, height: closeButtonHeight))
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(didCloseButtonTouch), for: .touchUpInside)
        self.view.addSubview(closeButton)
        
        /*
         Pay button
         */
        
        let payButtonY: CGFloat = 100
        let payButtonWidth: CGFloat = 100
        let payButtonHeight: CGFloat = payButtonWidth
        let payButtonX: CGFloat = 150
        
        let payButton = UIButton(frame: CGRect(x: payButtonX, y: payButtonY, width: payButtonWidth, height: payButtonHeight))
        
        payButton.setTitle("Pay", for: .normal)
        
        payButton.layer.borderWidth = 1
        payButton.layer.borderColor = UIColor.white.cgColor
        
        payButton.layer.cornerRadius = payButtonWidth / 2
        
        self.view.addSubview(payButton)
        
        /*
         Request Button
         */
        let requestButtonY: CGFloat = 300
        let requestButtonWidth: CGFloat = 150
        let requestButtonHeight: CGFloat = 100
        let requestButtonX: CGFloat = 130
        
        let requestButton = UIButton(frame: CGRect(x: requestButtonX, y: requestButtonY, width: requestButtonWidth, height: requestButtonHeight))
        
        requestButton.setTitle("Request", for: .normal)
        
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.white.cgColor
        
        requestButton.layer.cornerRadius = 20
        
        self.view.addSubview(requestButton)
        
        
    }
}
