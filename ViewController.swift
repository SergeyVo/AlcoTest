//
//  ViewController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 3/29/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showFormWithTouchID(_ sender: UIButton) {
           let context:LAContext = LAContext()
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Automatic completion of user data Ilia Volynets" ) { (wasSuccessful, error) in
                    if wasSuccessful{
                        
                          
                              DispatchQueue.main.async { // Correct
                                Constants.chekAdmin = true
                                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let controller = storyboard.instantiateViewController(withIdentifier: "fourth")
                                 self.present(controller, animated: true, completion: nil)
                              }

                    }
            }

        }
        
    }
    

}
