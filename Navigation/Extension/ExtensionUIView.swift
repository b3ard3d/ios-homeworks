//
//  ExtantionUIView.swift
//  Navigation
//
//  Created by Роман on 22.03.2022.
//

import UIKit

extension UIView {
    
     func shake(count : Float = 3,for duration : TimeInterval = 0.3,withTranslation translation : Float = 3) {
         let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
         animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
         animation.repeatCount = count
         animation.duration = duration/TimeInterval(animation.repeatCount)
         animation.autoreverses = true
         animation.values = [translation, -translation]
         layer.add(animation, forKey: "shake")
     }
 }
