//
//  SettingsView.swift
//  Binder
//
//  Created by axellebot on 05/04/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import Stripe
import WARangeSlider

class SettingsView: UIViewController {
    
    @IBOutlet weak var currentTokenAmountSlider: UISlider!
    @IBOutlet weak var buyTokensAmountSlider: UISlider!
    @IBOutlet weak var buyTokensAmountPriceLabel: UILabel!
    @IBOutlet weak var rangeSliderViewContainer: UIView!
    @IBOutlet weak var searchDistanceSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame : CGRect = CGRect(x: rangeSliderViewContainer.frame.minX,
                                    y: rangeSliderViewContainer.frame.minY,
                                    width: rangeSliderViewContainer.frame.width * 0.82,
                                    height: rangeSliderViewContainer.frame.height * 0.1)
        let rangeSlider : RangeSlider = RangeSlider(frame: frame)
        self.view.addSubview(rangeSlider)
        rangeSlider.addTarget(self, action: #selector(self.rangeSliderValueChanged(_:)),
                              for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
    
    func rangeSliderValueChanged(_ : Any) {
        
    }
    
    @IBAction func buyTokensAmountCheckoutButtonPressed(_ sender: Any) {
        displayStripeAddCardController()
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

