//
//  ResultController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 8/3/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import Foundation
import UIKit

class ResultController : UIViewController {
    @IBOutlet weak var timeAfterLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
        
     
       
        resultLabel.text = String(Double(CalculateManager.shared.sortUser(weight: Constants.weight , gender: Constants.gender, age: Constants.age, countOfAlco: Constants.countOfAlco, prosentAlco: Constants.prosentAlco, eatBefore : Constants.eatBefore , eatDuring : Constants.eatDuring  , timeDrinkAlco : Constants.timeDrinkAlco , timeAfterDrinkAlco : Constants.timeAfterDrinkAlco )).rounded(toPlaces: 2))
        
        timeAfterLabel.text = String(Double(Constants.promileFromTime).rounded(toPlaces: 2))
    }
    
    @IBAction func push(_ sender: UIButton) {
        let notificationType = "Вы можете сесть за руль!"
               
                let notification = Notificationss()
               let alert = UIAlertController(title: "",
                                             message: "Напоминание создано",
                                             preferredStyle: .alert)
               
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                   
            notification.scheduleNotification(notificationType: notificationType)
               }
               
               alert.addAction(okAction)
               present(alert, animated: true, completion: nil)
    }
    
}
