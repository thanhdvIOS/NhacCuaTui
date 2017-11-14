//
//  PlayView.swift
//  NhacCuaTui
//
//  Created by Van Thanh on 8/21/17.
//  Copyright © 2017 Van Thanh. All rights reserved.
//

import UIKit


class PlayView: UIView {
    
    
    var homeController:HomeController?
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        gradient.colors = [UIColor.white.cgColor]
        return gradient
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.addSublayer(gradientLayer)
        self.backgroundColor = .white
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        self.isUserInteractionEnabled = true
    }
    
    
    
    
    func handlePanGesture(getureRecognizer: UIPanGestureRecognizer){

        let translate = getureRecognizer.translation(in: self.homeController?.view)
        
        print("y",translate.y)
        if getureRecognizer.state == UIGestureRecognizerState.began || getureRecognizer.state == UIGestureRecognizerState.changed {
            
            let distanceMove = frame.height - self.homeController!.heightPlayer
            let pathMove = abs(translate.y)
            let delta = pathMove/distanceMove
            //self.layer.addSublayer(gradientLayer)
            if frame.origin.y <= distanceMove && frame.origin.y >= 0 {
                frame.origin.y = distanceMove - abs(translate.y)
                gradientLayer.colors = [UIColor.rgb(red: 8, green: 12, blue: 16).cgColor,UIColor.rgb(red: 86, green: 87, blue: 99).cgColor,UIColor.rgb(red: 86, green: 87, blue: 99).cgColor,UIColor.rgb(red: 8, green: 12, blue: 16).cgColor]
                let distancePauseView = (-frame.width + self.homeController!.heightPlayer - 15)/2.0 + 52
                let distanceNextButton = -0.28*frame.width + 24
                let distancePreviousButton = (frame.width - 20)/2.0 - 0.28*frame.width
                
                self.homeController?.rightConstraintNextButton?.constant = -24 - abs(distanceNextButton)*delta
                self.homeController?.rightConstraintPauseView?.constant = -52 - abs(distancePauseView)*delta
                self.homeController?.leftConstraintPlaySong?.constant = -0.65*frame.width*delta
                self.homeController?.leftConstraintPreviousButton?.constant = 0.28*frame.width + distancePreviousButton*(1-delta)
                self.homeController?.leftConstraintOptionButton?.constant = -44*delta
                self.homeController?.rightConstraintLoopButton?.constant = 44*delta
            
            }
            
        }else if getureRecognizer.state == UIGestureRecognizerState.ended {
            
            if frame.origin.y < 2*frame.height/3.0 {
                frame.origin.y = 0
                self.homeController?.rightConstraintPauseView?.constant = (-frame.width + self.homeController!.heightPlayer - 15)/2.0
                self.homeController?.rightConstraintNextButton?.constant = -0.28*frame.width
                self.homeController?.pauseView.backgroundColor = .white
                self.homeController?.pauseButton.tintColor = .black
                self.homeController?.leftConstraintPlaySong?.constant = -0.65*frame.width
                self.homeController?.leftConstraintPreviousButton?.constant = 0.28*frame.width
                self.homeController?.leftConstraintOptionButton?.constant = -44
                self.homeController?.rightConstraintLoopButton?.constant = 44
                gradientLayer.colors = [UIColor.rgb(red: 8, green: 12, blue: 16).cgColor,UIColor.rgb(red: 86, green: 87, blue: 99).cgColor,UIColor.rgb(red: 86, green: 87, blue: 99).cgColor,UIColor.rgb(red: 8, green: 12, blue: 16).cgColor]
            }else {
                frame.origin.y = frame.height - self.homeController!.heightPlayer
                
                self.homeController?.rightConstraintPauseView?.constant = -52
                self.homeController?.rightConstraintNextButton?.constant = -24
                self.homeController?.pauseView.backgroundColor = .clear
                self.homeController?.pauseButton.tintColor = .white
                self.homeController?.leftConstraintPlaySong?.constant = 0
                self.homeController?.leftConstraintPreviousButton?.constant = (frame.width - 20)/2.0
                self.homeController?.leftConstraintOptionButton?.constant = 0
                self.homeController?.rightConstraintLoopButton?.constant = 0
                gradientLayer.colors = [UIColor.white.cgColor]
            }
        }
        //getureRecognizer.setTranslation(CGPoint(x:0,y:0), in: self.homeController?.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

