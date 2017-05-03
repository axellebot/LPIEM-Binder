//
//  SettingsView.swift
//  Binder
//
//  Created by axellebot on 05/04/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import Stripe

class SettingsView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        displayStripeAddCardController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayStripeAddCardController() {
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        // STPAddCardViewController must be shown inside a UINavigationController.
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        STPTheme.default().accentColor = UIColor(red:0.25, green:0.32, blue:0.71, alpha:1.00)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func chargeUser(token: STPToken, amount: Float) {
        
    }
    
}

extension SettingsView : STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        chargeUser(token: token, amount: 3.99);
    }
}

