//
//  ViewForeComponent.swift
//  NhacCuaTui
//
//  Created by Van Thanh on 8/15/17.
//  Copyright © 2017 Van Thanh. All rights reserved.
//

import UIKit

class ViewForeComponent: UIView {
    
    
    let iconMusic: UIImageView = {
    
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "icon_music.png")
        return iv
    }()
    
    let iconBallon: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "airballon.png")
        return iv
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponent()
    }
    
    
    private func setupComponent(){
        addSubview(iconMusic)
        addSubview(iconBallon)
        
        iconMusic.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconMusic.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        iconMusic.heightAnchor.constraint(equalToConstant: 36).isActive = true
        iconMusic.widthAnchor.constraint(equalToConstant: 27).isActive = true
        
        
        iconBallon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconBallon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        iconBallon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iconBallon.widthAnchor.constraint(equalToConstant: 43).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
