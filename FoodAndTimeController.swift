//
//  FoodAndTimeController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 5/19/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//


import Foundation
import UIKit

class FoodAndTimeController: UIViewController {
    
    
    var i : Double = 0
    @IBOutlet weak var timeAfterPickerView: UIPickerView!
    @IBOutlet weak var timePickerView: UIPickerView!
    @IBOutlet weak var eatBeforePickerView: UIPickerView!
    @IBOutlet weak var eatOrTimePickerView: UIPickerView!
    
    @IBOutlet weak var frstDescrip: UIImageView!
    @IBOutlet weak var secondDescrip: UIImageView!
    @IBOutlet weak var thrdDescrip: UIImageView!
    @IBOutlet weak var forthDescrip: UIImageView!
    @IBOutlet weak var lineImage: UIImageView!
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()

       
        addArr()
        
        Constants.timeDrinkAlco = "5 мин."
        
        Constants.eatBefore = "Нет"
        
        Constants.eatDuring = "Нет"
        
        Constants.timeAfterDrinkAlco = "< 0.5 ч."
       
}
    
    @IBAction func nextView(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "result")
        self.present(controller, animated: true, completion: nil)
    
        
    }
    
    func addArr(){
        Constants.arrayOfAlcoTime.removeAll()
        Constants.arrayOfAlcoTime.append("< 0.5 ч.")
        Constants.arrayOfAlcoTime.append("0.5 ч.")
        i = 0.5
        while i != 23.5 {
            i += 0.5
            
             Constants.arrayOfAlcoTime.append(String(i) + " ч.")
            
        }

         Constants.arrayOfAlcoTime.append("Сутки")
    }
    
   
}
extension FoodAndTimeController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView , numberOfRowsInComponent component: Int) -> Int {
        if pickerView == timePickerView {
                return  Constants.arrayOfAlcoTime.count

        }else if pickerView == eatBeforePickerView{
            return Constants.arrayOfEat.count
 
        }else if pickerView == timeAfterPickerView{
            return  Constants.arrayOfAlcoTime.count
            
        }else {
            return Constants.arrayOfEat.count

        }
    }
    

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if pickerView == timePickerView {
                       return  Constants.arrayOfAlcoTime[row]

               }else if pickerView == eatBeforePickerView{
                   return Constants.arrayOfEat[row]
        
               }else if pickerView == timeAfterPickerView{
                   
                   return  Constants.arrayOfAlcoTime[row]
                   
               }else {
                   return Constants.arrayOfEat[row]

               }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == timePickerView {
                       Constants.timeDrinkAlco =  Constants.arrayOfAlcoTime[row]
               }else if pickerView == eatBeforePickerView{
                   Constants.eatBefore = Constants.arrayOfEat[row]
        
               }else if pickerView == timeAfterPickerView{
                   
                   Constants.timeAfterDrinkAlco =  Constants.arrayOfAlcoTime[row]
                   
               }else {
                   Constants.eatDuring = Constants.arrayOfEat[row]

               }

           
        
    }
    
}
