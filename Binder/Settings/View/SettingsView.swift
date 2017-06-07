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
import Alamofire

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
    
    func rangeSliderValueChanged(_ : Any) {
        
    }
    
    @IBAction func buyTokensAmountCheckoutButtonPressed(_ sender: Any) {
        let alert : UIAlertController = UIAlertController(title: "Proceed to checkout", message: String(format:"You're about to pay %.2f $", buyTokensAmountSlider.value * 0.99), preferredStyle: UIAlertControllerStyle.alert)
        let actionBack : UIAlertAction = UIAlertAction(title: "No, go back", style: UIAlertActionStyle.cancel, handler: { (action : UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        })
        let actionOK : UIAlertAction = UIAlertAction(title: "Take my money", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
            self.displayStripeAddCardController()
        })
        
        alert.addAction(actionBack)
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func buyTokensSliderValueChanged(_ sender: Any) {
        buyTokensAmountPriceLabel.text = String(format:"Price : %.2f $ (%.0f tokens)", buyTokensAmountSlider.value * 0.99, round(buyTokensAmountSlider.value))
    }
    
}

extension SettingsView : STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        self.chargeUser(token: token, amount: self.buyTokensAmountSlider.value * 0.99)
    }
    
    func chargeUser(token: STPToken, amount: Float) {
        let params: Parameters = [
            "stripeToken": token.tokenId,
            "stripeAmount": String(amount)
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request("https://lucien.appsolute-preprod.fr/stripe/charge_user.php", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                if(json["statut"] as! Bool == true) {
                    // Sucess: update Firebase User value 'isPremium' : true
                    //FIRDatabase.database().reference().child("user").child("USERID").updateChildValues(["isPremium": true])
                    print("Transaction is OK")
                    //TODO : ADD THE TOKENS TO THE USER ACCOUNT
                }
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}

