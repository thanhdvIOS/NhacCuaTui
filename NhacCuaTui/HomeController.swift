//
//  HomeController.swift
//  NhacCuaTui
//
//  Created by Van Thanh on 8/17/17.
//  Copyright © 2017 Van Thanh. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let heightPlayer:CGFloat = 60.0
    
    
    
    let iconSinger: UIImageView = {
       
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "duymanh.png")
        return iv
        
    }()
    
    
    let nameSong: UITextView = {
       
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Xin lỗi dân chơi"
        return tv
        
    }()
    
    let authorSong: UITextView = {
        
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Duy mạnh"
        return tv
        
    }()
    
    
    let playSongView: UIView = {
    
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    
    let pauseView: UIView = {
       
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    
    let pauseButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "pause_internal.png").withRenderingMode(.alwaysTemplate)
        bt.setImage(image, for: UIControlState.normal)
        bt.tintColor = .white
        return bt
    }()
    
    
    let nextButton: UIButton = {
       
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(#imageLiteral(resourceName: "next.png"), for: UIControlState.normal)
        return bt
        
    }()
    
    let previousButton: UIButton = {
        
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(#imageLiteral(resourceName: "previous.png"), for: UIControlState.normal)
        return bt
        
    }()
    
    
    let loopButton: UIButton = {
        
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(#imageLiteral(resourceName: "loop.png"), for: UIControlState.normal)
        return bt
        
    }()
    
    
    let optionButton: UIButton = {
        
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(#imageLiteral(resourceName: "option.png"), for: UIControlState.normal)
        return bt
        
    }()
    
    
    
    lazy var playView: PlayView = {
       
        let v = PlayView(frame: CGRect(x: 0, y: self.view.frame.height - self.heightPlayer, width: self.view.frame.width, height: self.view.frame.height))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.homeController = self
        return v
    }()
    
    
    var rightConstraintPauseView: NSLayoutConstraint?
    var rightConstraintNextButton: NSLayoutConstraint?
    var leftConstraintPlaySong: NSLayoutConstraint?
    var leftConstraintOptionButton: NSLayoutConstraint?
    var rightConstraintLoopButton: NSLayoutConstraint?
    var leftConstraintPreviousButton: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "Nhac cua tui"
        view.backgroundColor = .white
        perform(#selector(handlePresentAbout), with: nil, afterDelay: 0)
        view.addSubview(playView)
        view.addSubview(previousButton)
        view.addSubview(playSongView)
        view.addSubview(nextButton)
        view.addSubview(pauseView)
        view.addSubview(loopButton)
        view.addSubview(optionButton)
        
        
        
        leftConstraintPlaySong = playSongView.leftAnchor.constraint(equalTo: view.leftAnchor)
        leftConstraintPlaySong?.isActive = true
        playSongView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        playSongView.heightAnchor.constraint(equalToConstant: heightPlayer).isActive = true
        playSongView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        playSongView.backgroundColor = .clear
        playSongView.isUserInteractionEnabled = false
        
        playSongView.addSubview(iconSinger)
        playSongView.addSubview(nameSong)
        playSongView.addSubview(authorSong)
        
        
        iconSinger.topAnchor.constraint(equalTo: playSongView.topAnchor).isActive = true
        iconSinger.leftAnchor.constraint(equalTo: playSongView.leftAnchor).isActive = true
        iconSinger.heightAnchor.constraint(equalTo: playSongView.heightAnchor).isActive = true
        iconSinger.widthAnchor.constraint(equalToConstant: self.heightPlayer).isActive = true
        
        nameSong.topAnchor.constraint(equalTo: playSongView.topAnchor, constant: 10).isActive = true
        nameSong.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameSong.leftAnchor.constraint(equalTo: iconSinger.rightAnchor , constant: 8).isActive = true
        nameSong.rightAnchor.constraint(equalTo: playSongView.rightAnchor, constant: -8).isActive = true
        
        authorSong.topAnchor.constraint(equalTo: nameSong.bottomAnchor, constant: 0).isActive = true
        authorSong.heightAnchor.constraint(equalToConstant: 20).isActive = true
        authorSong.leftAnchor.constraint(equalTo: iconSinger.rightAnchor , constant: 8).isActive = true
        authorSong.rightAnchor.constraint(equalTo: playSongView.rightAnchor, constant: -8).isActive = true
        
        
        nextButton.centerYAnchor.constraint(equalTo: playSongView.centerYAnchor).isActive = true
        rightConstraintNextButton = nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24)
        rightConstraintNextButton?.isActive = true
 
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        rightConstraintPauseView = pauseView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(8+20+24))
        rightConstraintPauseView?.isActive = true
        
        pauseView.centerYAnchor.constraint(equalTo: playSongView.centerYAnchor).isActive = true
        pauseView.heightAnchor.constraint(equalToConstant: heightPlayer-15).isActive = true
        pauseView.widthAnchor.constraint(equalToConstant: heightPlayer-15).isActive = true
        pauseView.layer.cornerRadius = (heightPlayer - 15)/2.0
        pauseView.layer.masksToBounds = true
        pauseView.backgroundColor = .clear
        pauseView.addSubview(pauseButton)
        
        pauseButton.centerYAnchor.constraint(equalTo: pauseView.centerYAnchor).isActive = true
        pauseButton.centerXAnchor.constraint(equalTo: pauseView.centerXAnchor).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        optionButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        optionButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        optionButton.centerYAnchor.constraint(equalTo: playSongView.centerYAnchor).isActive = true
        leftConstraintOptionButton = optionButton.leftAnchor.constraint(equalTo: view.rightAnchor)
        leftConstraintOptionButton?.isActive = true
        
        
        loopButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        loopButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loopButton.centerYAnchor.constraint(equalTo: playSongView.centerYAnchor).isActive = true
        rightConstraintLoopButton = loopButton.rightAnchor.constraint(equalTo: view.leftAnchor)
        rightConstraintLoopButton?.isActive = true
        
        
        previousButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        previousButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        previousButton.centerYAnchor.constraint(equalTo: playSongView.centerYAnchor).isActive = true
        leftConstraintPreviousButton = previousButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: (view.frame.width-20)/2.0)
        leftConstraintPreviousButton?.isActive = true
        
    
    }
    
    
    func handlePresentAbout(){
        let aboutControl = AboutController()
        self.navigationController?.present(aboutControl, animated: true, completion: nil)
    }

    // ubuntu branch1
    // ubuntu branch1
    //branch1

}
