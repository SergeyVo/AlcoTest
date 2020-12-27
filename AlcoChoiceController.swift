//
//  AlcoChoiceController.swift
//  AlcoTest
//
//  Created by Ilya Volynets on 4/8/20.
//  Copyright © 2020 Ilya Volynets. All rights reserved.
//

import Foundation
import UIKit


class AlcoChoiceController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var alcoCollectionView: UICollectionView!
    
    @IBOutlet weak var stepTwoImage: UIImageView!

    @IBOutlet weak var alcoPageControl: UIPageControl!
    
    
    @IBOutlet weak var alcoImage: UIImageView!
    
    
    
    fileprivate let items: [City] = City.buildCities()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
           super.viewDidLoad()
         if Constants.chekAdmin == true{
            stepTwoImage.image = UIImage(named: "i_v4")
            
         }else{
            stepTwoImage.image = UIImage(named: "2_v2")
        }
       
           collectionView.collectionViewLayout = CityCollectionViewFlowLayout(itemSize: CityCollectionViewCell.cellSize);
           collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
       }
    
   
    @IBAction func backButton(_ sender: UIButton) {
       goBack()
    }
    @IBAction func nextButton(_ sender: UIButton) {
        
    }
   
    @IBAction func chekTruePosition(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIPanGestureRecognizer.State.ended 	{
        }
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        if Constants.indexPage == 0{
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let controller = storyboard.instantiateViewController(withIdentifier: "fourth")
                       self.present(controller, animated: true, completion: nil)
        } else if Constants.indexPage == 1{
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let controller = storyboard.instantiateViewController(withIdentifier: "fourth")
                       self.present(controller, animated: true, completion: nil)
        } else if Constants.indexPage == 2{
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "fifth")
                        self.present(controller, animated: true, completion: nil)
            
        }
        
    }
    
    func goBack() {
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

}

extension AlcoChoiceController {
    
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
       
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        cell.configure(with: items[indexPath.item], collectionView: collectionView, index: indexPath.row)
    
        Constants.indexPage = indexPath.row
        alcoPageControl.currentPage = Constants.indexPage
        return cell
    }
}
