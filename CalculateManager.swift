//
//  CalculateManager.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 8/3/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import Foundation

class CalculateManager {

    
    static let shared = CalculateManager()

    private init(){}
    
    func sortUser ( weight : Double , gender : Int , age : Double , countOfAlco : [Double] ,
                    prosentAlco : [Double], eatBefore : String, eatDuring : String ,
                    timeDrinkAlco : String , timeAfterDrinkAlco : String ) -> Double{
        var i = 0
        var promile : Double = 0
        var timeAlc : Double = 0
        for element in countOfAlco {
            
            promile += element * prosentAlco[i] / 100
          i += 1
        }

        if eatBefore == "Нет"{
            promile = promile - (promile * 10 / 100)
        } else if eatBefore == "Мало"{
            promile = promile - (promile * 15 / 100)
        } else if eatBefore == "Средне"{
            promile = promile - (promile * 20 / 100)
        } else if eatBefore == "Хорошо"{
            promile = promile - (promile * 25 / 100)
        } else if eatBefore == "Сыт" {
            promile = promile - (promile * 30 / 100)
        }
        
        if gender == 0 {
            promile = promile / (weight * 0.70)
        } else {
            promile = promile / (weight * 0.60)
        }

     
        for m in (0...Constants.arrayOfAlcoTime.count - 1) {
            if Constants.arrayOfAlcoTime[m] == timeDrinkAlco{
                timeAlc = Double(m).rounded(toPlaces: 2)
                break
        }
    }
        Constants.promileFromTime = promile - (0.075 * timeAlc)
    
        if Constants.promileFromTime <= 0{
            Constants.promileFromTime = 0
        }
        
        return promile
}
}

