//
//  ConnectionView.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ConnectionView: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var handle: FIRAuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            if user != nil {
                self.goToHome()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        FIRAuth.auth()?.removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: loginField.text!, password: passwordField.text!) { (user, error)in
            
            if error != nil {
                let alert = UIAlertController(title: "Connection issue", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.goToHome()
            }
            
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: loginField.text!, password: passwordField.text!){ (user, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Connection issue", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.goToHome()
            }
            
        }
    }
    
    private func goToHome() {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController")
        self.present(homeViewController!, animated: true, completion: nil)
    }
    @IBAction func googleConnection(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}
