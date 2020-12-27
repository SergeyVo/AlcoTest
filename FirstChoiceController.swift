//
//  FirstChoiceController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 5/4/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import Foundation
import UIKit


class FirstChoiceController: UIViewController {
    @IBOutlet weak var countAlcoLabel: UILabel!
    @IBOutlet weak var myStackView: UIStackView!
    @IBOutlet weak var heightConstrain: NSLayoutConstraint!
    @IBOutlet weak var movingView: UIView!
    
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    
    @IBOutlet weak var color2Slider: UISlider!
    @IBOutlet weak var colorSlider: UISlider!
    @IBOutlet weak var kolvoLabel: UILabel!
    @IBOutlet weak var krepostLabel: UILabel!
    
    var color = UIColor()
    var differenceHight : CGFloat = 239
    let step: Float = 50
    var upOrDown = true
    var countAlco = 1
    let button1 = UIButton()
    let image2 = UIImageView() , line2 = UIImageView() , slider2_1 = UISlider(), slider2_2 = UISlider(), label2_1 = UILabel(), label2_2 = UILabel(), button2_1 = UIButton(), button2_2 = UIButton()
    let image3 = UIImageView() , line3 = UIImageView() , slider3_1 = UISlider(), slider3_2 = UISlider(), label3_1 = UILabel(), label3_2 = UILabel(), button3_1 = UIButton(), button3_2 = UIButton()
    let image4 = UIImageView() , line4 = UIImageView() , slider4_1 = UISlider(), slider4_2 = UISlider(), label4_1 = UILabel(), label4_2 = UILabel(), button4_1 = UIButton(), button4_2 = UIButton()
    let image5 = UIImageView() , line5 = UIImageView() , slider5_1 = UISlider(), slider5_2 = UISlider(), label5_1 = UILabel(), label5_2 = UILabel(), button5_1 = UIButton(), button5_2 = UIButton()

    var i = 0
    
override func viewDidLoad() {
    super.viewDidLoad()
    self.createButton(myButton: button1, name: "next1", top: 478, height: 45, leading: 167, trailing: -22)
    button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
    color  = colorSlider.minimumTrackTintColor!
    
}
    @IBAction func backButton(_ sender: UIButton) {

            if Constants.chekAdmin == true{
                       Constants.chekAdmin = false
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let controller = storyboard.instantiateViewController(withIdentifier: "first")
                       self.present(controller, animated: true, completion: nil)
                   } else {
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let controller = storyboard.instantiateViewController(withIdentifier: "second")
                       self.present(controller, animated: true, completion: nil)
                   }
        
    }
    @IBAction func leftButton(_ sender: UIButton) {
        minusOnLabelProcent(myLabel: krepostLabel, mySlider: color2Slider)
    }
    @IBAction func rightButton(_ sender: UIButton) {
        plusOnLabelProcent(myLabel: krepostLabel, mySlider: color2Slider)
    }
    
    @IBAction func vipilSlider(_ sender: UISlider) {
        previewOnLabelMl(myLabel: kolvoLabel, mySlider: sender)
       
    }
    @IBAction func krepostSlider(_ sender: UISlider) {
        previewOnLabelProcent(myLabel: krepostLabel, mySlider: sender)
    }
    
    @IBAction func upButton(_ sender: UIButton) {
        upOrDown = true
        downBtn.isEnabled = true
        countAlco += 1
        countAlcoLabel.text = String(countAlco)
        if countAlco == 5{
            sender.isEnabled = false
        }
       
        mainAddElements(count: countAlco)
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        upOrDown = false
        upBtn.isEnabled = true
        countAlco -= 1
         countAlcoLabel.text = String(countAlco)
        if countAlco == 1{
            sender.isEnabled = false
        }
        
        mainAddElements(count: countAlco)
        
    }
    
    
    func mainAddElements (count: Int){
        switch count {
        case 1:
            if upOrDown == false{
                image2.removeFromSuperview()
                line2.removeFromSuperview()
                slider2_1.removeFromSuperview()
                slider2_2.removeFromSuperview()
                label2_1.removeFromSuperview()
                label2_2.removeFromSuperview()
                button1.removeFromSuperview()
                button2_1.removeFromSuperview()
                button2_2.removeFromSuperview()
                self.createButton(myButton: button1, name: "next1", top: differenceHight * 2, height: 45, leading: 167, trailing: -22)
                button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
                addHeightConstrain(height: -239)
                
            }
        case 2:
            if upOrDown == true{
            button1.removeFromSuperview()
            addHeightConstrain(height: 239)
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 3, height: 45, leading: 167, trailing: -22)
            self.createImage(myImage: line2 , top : 481 , height : 1 , leading : 26 , trailing : -26, name : "whiteLine")
            self.createImage(myImage: image2 , top : 501 , height : 197 , leading : 14 , trailing : -14, name : "alck2")
            self.createSlider(mySlider: slider2_1, top: 329 + differenceHight, min: 50, max: 5000, value: 1250, leading : 30 , trailing : -32 )
            self.createSlider(mySlider: slider2_2, top: 405 + differenceHight, min: 2, max: 95, value: 40, leading : 56 , trailing : -58)
            self.createLabel(myLabel: label2_1, text : "1250 мл.", top : 303 + differenceHight, leading : 204 )
            self.createLabel(myLabel: label2_2, text : "40%", top : 380 + differenceHight, leading : 227 )
            self.createButton(myButton: button2_1, name: "leftBtn", top: 162 + differenceHight * 2, height: 38, leading: 21, trailing: -265)
            self.createButton(myButton: button2_2, name: "rightBtn", top: 162 + differenceHight * 2, height: 38, leading: 265, trailing: -21)
                slider2_1.addTarget(self, action: #selector(actionSlider2_1), for: .valueChanged)
                slider2_2.addTarget(self, action: #selector(actionSlider2_2), for: .valueChanged)
                button2_1.addTarget(self, action: #selector(actionButton2_1), for: .touchUpInside)
                button2_2.addTarget(self, action: #selector(actionButton2_2), for: .touchUpInside)
                button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
            }else{
            image3.removeFromSuperview()
            line3.removeFromSuperview()
            slider3_1.removeFromSuperview()
            slider3_2.removeFromSuperview()
            label3_1.removeFromSuperview()
            label3_2.removeFromSuperview()
            button1.removeFromSuperview()
            button3_1.removeFromSuperview()
            button3_2.removeFromSuperview()
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 3, height: 45, leading: 167, trailing: -22)
            addHeightConstrain(height: -239)
            }
        case 3:
            if upOrDown == true{
            button1.removeFromSuperview()
            addHeightConstrain(height: 239)
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 4, height: 45, leading: 167, trailing: -22)
            self.createImage(myImage: line3 , top : 481 + differenceHight , height : 1 , leading : 26 , trailing : -26, name : "whiteLine")
            self.createImage(myImage: image3 , top : 501 + differenceHight , height : 197 , leading : 14 , trailing : -14, name : "alck3")
            self.createSlider(mySlider: slider3_1, top: 329 + differenceHight * 2, min: 50, max: 5000, value: 1250, leading : 30 , trailing : -32 )
            self.createSlider(mySlider: slider3_2, top: 405 + differenceHight * 2, min: 2, max: 95, value: 40, leading : 56 , trailing : -58)
                self.createLabel(myLabel: label3_1, text : "1250 мл.", top : 303 + differenceHight * 2, leading : 204 )
                self.createLabel(myLabel: label3_2, text : "40%", top : 380 + differenceHight * 2 , leading : 227 )
                self.createButton(myButton: button3_1, name: "leftBtn", top: 162 + differenceHight * 3, height: 38, leading: 21, trailing: -265)
                self.createButton(myButton: button3_2, name: "rightBtn", top: 162 + differenceHight * 3, height: 38, leading: 265, trailing: -21)
                slider3_1.addTarget(self, action: #selector(actionSlider3_1), for: .valueChanged)
                slider3_2.addTarget(self, action: #selector(actionSlider3_2), for: .valueChanged)
                button3_1.addTarget(self, action: #selector(actionButton3_1), for: .touchUpInside)
                button3_2.addTarget(self, action: #selector(actionButton3_2), for: .touchUpInside)
                button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
            }else{
            image4.removeFromSuperview()
            line4.removeFromSuperview()
            slider4_1.removeFromSuperview()
            slider4_2.removeFromSuperview()
            label4_1.removeFromSuperview()
            label4_2.removeFromSuperview()
            button1.removeFromSuperview()
            button4_1.removeFromSuperview()
            button4_2.removeFromSuperview()
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 4, height: 45, leading: 167, trailing: -22)
            addHeightConstrain(height: -239)
            }
        case 4:
            if upOrDown == true{
            button1.removeFromSuperview()
            addHeightConstrain(height: 239)
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 5, height: 45, leading: 167, trailing: -22)
            self.createImage(myImage: line4 , top : 481 + differenceHight * 2, height : 1 , leading : 26 , trailing : -26, name : "whiteLine")
            self.createImage(myImage: image4 , top : 501 + differenceHight * 2 , height : 197 , leading : 14 , trailing : -14, name : "alck4")
                self.createSlider(mySlider: slider4_1, top: 329 + differenceHight * 3, min: 50, max: 5000, value: 1250, leading : 30 , trailing : -32 )
                self.createSlider(mySlider: slider4_2, top: 405 + differenceHight * 3, min: 2, max: 95, value: 40, leading : 56 , trailing : -58)
                self.createLabel(myLabel: label4_1, text : "1250 мл.", top : 303 + differenceHight * 3, leading : 204 )
                self.createLabel(myLabel: label4_2, text : "40%", top : 380 + differenceHight * 3, leading : 227 )
                self.createButton(myButton: button4_1, name: "leftBtn", top: 162 + differenceHight * 4, height: 38, leading: 21, trailing: -265)
                self.createButton(myButton: button4_2, name: "rightBtn", top: 162 + differenceHight * 4, height: 38, leading: 265, trailing: -21)
                slider4_1.addTarget(self, action: #selector(actionSlider4_1), for: .valueChanged)
                slider4_2.addTarget(self, action: #selector(actionSlider4_2), for: .valueChanged)
                button4_1.addTarget(self, action: #selector(actionButton4_1), for: .touchUpInside)
                button4_2.addTarget(self, action: #selector(actionButton4_2), for: .touchUpInside)
                button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
            }else{
            image5.removeFromSuperview()
            line5.removeFromSuperview()
            slider5_1.removeFromSuperview()
            slider5_2.removeFromSuperview()
            label5_1.removeFromSuperview()
            label5_2.removeFromSuperview()
            button1.removeFromSuperview()
            button5_1.removeFromSuperview()
            button5_2.removeFromSuperview()
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 5, height: 45, leading: 167, trailing: -22)
            addHeightConstrain(height: -239)
            }
        case 5:
            if upOrDown == true{
            button1.removeFromSuperview()
            addHeightConstrain(height: 239)
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 6, height: 45, leading: 167, trailing: -22)
            self.createImage(myImage: line5 , top : 481 + differenceHight * 3, height : 1 , leading : 26 , trailing : -26, name : "whiteLine")
            self.createImage(myImage: image5 , top : 501 + differenceHight * 3, height : 197 , leading : 14 , trailing : -14, name : "alck5")
                self.createSlider(mySlider: slider5_1, top: 329 + differenceHight * 4, min: 50, max: 5000, value: 1250, leading : 30 , trailing : -32 )
                self.createSlider(mySlider: slider5_2, top: 405 + differenceHight * 4, min: 2, max: 95, value: 40, leading : 56 , trailing : -58 )
                self.createLabel(myLabel: label5_1, text : "1250 мл.", top : 303 + differenceHight * 4, leading : 204 )
                self.createLabel(myLabel: label5_2, text : "40%", top : 380 + differenceHight * 4, leading : 227 )
                self.createButton(myButton: button5_1, name: "leftBtn", top: 162 + differenceHight * 5, height: 38, leading: 21, trailing: -265)
                self.createButton(myButton: button5_2, name: "rightBtn", top: 162 + differenceHight * 5, height: 38, leading: 265, trailing: -21)
                slider5_1.addTarget(self, action: #selector(actionSlider5_1), for: .valueChanged)
                slider5_2.addTarget(self, action: #selector(actionSlider5_2), for: .valueChanged)
                button5_1.addTarget(self, action: #selector(actionButton5_1), for: .touchUpInside)
                button5_2.addTarget(self, action: #selector(actionButton5_2), for: .touchUpInside)
                button1.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
            }else{
            button1.removeFromSuperview()
            
            self.createButton(myButton: button1, name: "next1", top: differenceHight * 6, height: 45, leading: 167, trailing: -22)
            addHeightConstrain(height: -239)
            }
        default:
            print("error11")
        }
    }
    
    
    @objc func actionButton1(){
        Constants.countOfAlco.removeAll()
        Constants.prosentAlco.removeAll()
        Constants.countOfAlco.append(Double(colorSlider.value))
        Constants.prosentAlco.append(Double(color2Slider.value))
        switch countAlco {
            case 2:
                Constants.countOfAlco.append(Double(slider2_1.value))
            Constants.prosentAlco.append(Double(slider2_2.value))
            case 3:
            Constants.countOfAlco.append(Double(slider2_1.value))
            Constants.prosentAlco.append(Double(slider2_2.value))
            Constants.countOfAlco.append(Double(slider3_1.value))
            Constants.prosentAlco.append(Double(slider3_2.value))
            case 4:

            Constants.countOfAlco.append(Double(slider2_1.value))
            Constants.prosentAlco.append(Double(slider2_2.value))
            Constants.countOfAlco.append(Double(slider3_1.value))
            Constants.prosentAlco.append(Double(slider3_2.value))
            Constants.countOfAlco.append(Double(slider4_1.value))
            Constants.prosentAlco.append(Double(slider4_2.value))
            case 5:
            Constants.countOfAlco.append(Double(slider2_1.value))
            Constants.prosentAlco.append(Double(slider2_2.value))
            Constants.countOfAlco.append(Double(slider3_1.value))
            Constants.prosentAlco.append(Double(slider3_2.value))
            Constants.countOfAlco.append(Double(slider4_1.value))
            Constants.prosentAlco.append(Double(slider4_2.value))
            Constants.countOfAlco.append(Double(slider5_1.value))
            Constants.prosentAlco.append(Double(slider5_2.value))
            
            default:
            print("error1")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let controller = storyboard.instantiateViewController(withIdentifier: "sixth")
              self.present(controller, animated: true, completion: nil)
        
    }
    
    
    
    
    @objc func actionButton2_1(){
           minusOnLabelProcent(myLabel: label2_2, mySlider: slider2_2)
       }
    @objc func actionButton2_2(){
             plusOnLabelProcent(myLabel : label2_2 , mySlider: slider2_2)
          }
    @objc func actionButton3_1(){
              minusOnLabelProcent(myLabel: label3_2, mySlider: slider3_2)
          }
    @objc func actionButton3_2(){
             plusOnLabelProcent(myLabel : label3_2 , mySlider: slider3_2)
          }
    @objc func actionButton4_1(){
              minusOnLabelProcent(myLabel: label4_2, mySlider: slider4_2)
          }
    @objc func actionButton4_2(){
             plusOnLabelProcent(myLabel : label4_2 , mySlider: slider4_2)
          }
    @objc func actionButton5_1(){
             minusOnLabelProcent(myLabel: label5_2, mySlider: slider5_2)
          }
    @objc func actionButton5_2(){
             plusOnLabelProcent(myLabel : label5_2 , mySlider: slider5_2)
          }
    
    
    
    
    
    @objc func actionSlider2_1(){
        previewOnLabelMl(myLabel : label2_1 , mySlider: slider2_1)
    }
    
    @objc func actionSlider2_2(){
        previewOnLabelProcent(myLabel : label2_2 , mySlider: slider2_2)
    }
    @objc func actionSlider3_1(){
        previewOnLabelMl(myLabel : label3_1 , mySlider: slider3_1)
    }
    
    @objc func actionSlider3_2(){
        previewOnLabelProcent(myLabel : label3_2 , mySlider: slider3_2)
    }
    @objc func actionSlider4_1(){
        previewOnLabelMl(myLabel : label4_1 , mySlider: slider4_1)
    }
    
    @objc func actionSlider4_2(){
        previewOnLabelProcent(myLabel : label4_2 , mySlider: slider4_2)
    }
    @objc func actionSlider5_1(){
        previewOnLabelMl(myLabel : label5_1 , mySlider: slider5_1)
    }
    
    @objc func actionSlider5_2(){
        previewOnLabelProcent(myLabel : label5_2 , mySlider: slider5_2)
    }
    
    
    
    
    
    func minusOnLabelProcent(myLabel : UILabel , mySlider: UISlider){
        mySlider.value = mySlider.value - 0.1
        myLabel.text = String(Double(mySlider.value).rounded(toPlaces: 1)) + "%"
    }
    
    func plusOnLabelProcent(myLabel : UILabel , mySlider: UISlider){
        mySlider.value = mySlider.value + 0.1
        myLabel.text = String(Double(mySlider.value).rounded(toPlaces: 1)) + "%"
    }
    
    func previewOnLabelMl(myLabel : UILabel , mySlider: UISlider){
        let roundedValue = round(mySlider.value / step) * step
        mySlider.value = roundedValue
        myLabel.text = String(Int(mySlider.value)) + " мл."
    }
    
    func previewOnLabelProcent(myLabel : UILabel , mySlider: UISlider){
        myLabel.text = String(Double(mySlider.value).rounded(toPlaces: 1)) + "%"
    }
    
    func addHeightConstrain(height : CGFloat){
        DispatchQueue.main.async {
            //self.i += height
            self.heightConstrain.constant = self.heightConstrain.constant + height
            self.movingView.layoutIfNeeded()
        }
    }
    
    func createImage(myImage: UIImageView , top : CGFloat , height : CGFloat , leading : CGFloat , trailing : CGFloat , name : String) {
        myImage.image = UIImage(named: name)
        movingView.addSubview(myImage)
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.leadingAnchor.constraint(equalTo: movingView.leadingAnchor, constant: leading).isActive = true
        myImage.trailingAnchor.constraint(equalTo: movingView.trailingAnchor , constant: trailing).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: height).isActive = true
        myImage.topAnchor.constraint(equalTo: movingView.topAnchor, constant: top).isActive = true
        
    }
    
    func createButton(myButton : UIButton, name: String   ,top : CGFloat, height : CGFloat , leading : CGFloat , trailing : CGFloat ) {
        
        myButton.setBackgroundImage(UIImage(named: name), for: .normal)
        movingView.addSubview(myButton)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.leadingAnchor.constraint(equalTo: movingView.leadingAnchor, constant: leading).isActive = true
        myButton.trailingAnchor.constraint(equalTo: movingView.trailingAnchor , constant: trailing).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: height).isActive = true
        myButton.topAnchor.constraint(equalTo: movingView.topAnchor, constant: top).isActive = true
        
    }
    
    func createSlider(mySlider: UISlider, top : CGFloat, min : Float, max : Float, value: Float , leading : CGFloat , trailing : CGFloat ) {
        mySlider.minimumValue = min
        mySlider.maximumValue = max
        mySlider.value = value
        mySlider.maximumTrackTintColor = UIColor.darkGray
        mySlider.minimumTrackTintColor = color
        movingView.addSubview(mySlider)
        
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        mySlider.leadingAnchor.constraint(equalTo: movingView.leadingAnchor, constant: leading).isActive = true
        mySlider.trailingAnchor.constraint(equalTo: movingView.trailingAnchor , constant: trailing).isActive = true
        mySlider.topAnchor.constraint(equalTo: movingView.topAnchor, constant: top).isActive = true
        
    }
    
    func createLabel(myLabel: UILabel, text : String, top : CGFloat, leading : CGFloat ) {
        myLabel.text = text
        myLabel.textColor = .white
        myLabel.font.withSize(17)
        myLabel.textAlignment = NSTextAlignment.right
        movingView.addSubview(myLabel)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: movingView.leadingAnchor, constant: leading).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: movingView.trailingAnchor , constant: -32).isActive = true
        myLabel.topAnchor.constraint(equalTo: movingView.topAnchor, constant: top).isActive = true
        
    }
    
    
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

