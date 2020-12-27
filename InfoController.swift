//
//  InfoController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 4/3/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import Foundation
import UIKit


class InfoController: UIViewController {
   
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rigthBtn: UIButton!

    
    @IBOutlet weak var genderChoiceSegmentedControl: UISegmentedControl!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func changeWeight(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + " кг."
        Constants.weight = Double(sender.value)
    }

    
    @IBAction func nextButton(_ sender: UIButton) {
        Constants.gender = genderChoiceSegmentedControl.selectedSegmentIndex
          
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "fourth")
        self.present(controller, animated: true, completion: nil)
        if yearLabel.text == "18-25 лет"{
            Constants.age = 0
        }
        if yearLabel.text == "26-35 лет"{
            Constants.age = Constants.weight * 0.02
        }
        if yearLabel.text == "36-50 лет"{
            Constants.age = Constants.weight * 0.04
        }
        if yearLabel.text == "51-60 лет"{
            Constants.age = Constants.weight * 0.06
        }
        if yearLabel.text == "61-75 лет"{
            Constants.age = Constants.weight * 0.08
        }
        if yearLabel.text == "75+ лет"{
            Constants.age = Constants.weight * 0.1
        }
    }
    
    
    @IBAction func leftYearButton(_ sender: UIButton) {
        rigthBtn.isEnabled = true
        count -= 1
               yearLabel.text = "18-25 лет"
                
               if count == 0{
                   sender.isEnabled = false
               }
               if count == 1{
                   yearLabel.text = "26-35 лет"
               }
               if count == 2{
                   yearLabel.text = "36-50 лет"
               }
               if count == 3{
                   yearLabel.text = "51-60 лет"
               }
               if count == 4{
                   yearLabel.text = "61-75 лет"
               }
               if count == 5{
                   yearLabel.text = "75+ лет"
               }
        
        
    }
    
    @IBAction func rigthYearButton(_ sender: UIButton) {
        leftBtn.isEnabled = true
       count += 1
       yearLabel.text = "18-25 лет"
       if count == 5{
           sender.isEnabled = false
       }
       if count == 1{
           yearLabel.text = "26-35 лет"
       }
       if count == 2{
           yearLabel.text = "36-50 лет"
       }
       if count == 3{
           yearLabel.text = "51-60 лет"
       }
       if count == 4{
           yearLabel.text = "61-75 лет"
       }
       if count == 5{
           yearLabel.text = "75+ лет"
       }
       
        
    }
    
    
}
