//
//  File.swift
//  Binder
//
//  Created by Axel Turlier on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import Stripe

class CheckoutView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CheckoutView : STPPaymentContextDelegate {
    func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
        // Probably useless here, we only have 1 payment method
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: @escaping STPErrorBlock) {
        
        /*myAPIClient.createCharge(paymentResult.source.stripeID, completion: { (error: Error?) in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        })*/
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFinishWith status: STPPaymentStatus, error: Error?) {
//        switch status {
//        case .error:
//            self.showError(error)
//        case .success:
//            self.showReceipt()
//        case .userCancellation:
//            return // Do nothing
//        }
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFailToLoadWithError error: Error) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CheckoutView : STPBackendAPIAdapter {
    func retrieveCustomer(_ completion: @escaping STPCustomerCompletionBlock) {
        
    }
    
    func attachSource(toCustomer source: STPSource, completion: @escaping STPErrorBlock) {
        
    }
    
    func selectDefaultCustomerSource(_ source: STPSource, completion: @escaping STPErrorBlock) {
        
    }
}

