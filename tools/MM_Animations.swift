//
//  MM_Animations.swift
//  LottieDemo
//
//  Created by yuchen on 2018/4/24.
//  Copyright © 2018年 yuchen. All rights reserved.
//

import UIKit

class MM_Animations: NSObject ,CAAnimationDelegate{
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    var gradientChangeAnimation: CABasicAnimation?
    
    let gradientOne = UIColor(red: 102/255, green: 62/255, blue: 180/255, alpha: 1).cgColor
    let gradientTwo = UIColor(red: 154/255, green: 48/255, blue: 174/255, alpha: 1).cgColor
    let gradientThree = UIColor(red: 242/255, green: 69/255, blue: 61/255, alpha: 1).cgColor
    

    func setupLayer(layer:CALayer)  {
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
//        gradientSet.append([gradientOne, gradientTwo])
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        layer.addSublayer(gradient)
        
        
        gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation!.duration = 1.0
        gradientChangeAnimation!.fillMode = kCAFillModeForwards
        gradientChangeAnimation!.isRemovedOnCompletion = false
        gradientChangeAnimation!.delegate = self
        
        animateGradient()
    }
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        gradientChangeAnimation!.toValue = gradientSet[currentGradient]
        gradient.add(gradientChangeAnimation!, forKey: "colorChange")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
}
