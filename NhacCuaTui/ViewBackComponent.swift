//
//  ViewBackComponent.swift
//  NhacCuaTui
//
//  Created by Van Thanh on 8/15/17.
//  Copyright © 2017 Van Thanh. All rights reserved.
//

import UIKit

class ViewBackComponent: UIView {

    let cloud1: UIImageView = {
       
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "cloud")
        return iv
        
    }()
    
    let cloud2: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "cloud2")
        return iv
        
    }()
    
    
    let cloud3: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "clound1")
        return iv
        
    }()
    
    
    private func setupComponent(){
        
        addSubview(cloud1)
        addSubview(cloud2)
        addSubview(cloud3)
        
        cloud1.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        cloud1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        cloud1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        cloud1.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        
        cloud2.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        cloud2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        cloud2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cloud2.widthAnchor.constraint(equalToConstant: 43).isActive = true
        
        
        cloud3.centerXAnchor.constraint(equalTo: cloud2.centerXAnchor, constant: 0).isActive = true
        cloud3.bottomAnchor.constraint(equalTo: cloud2.topAnchor, constant: -50).isActive = true
        cloud3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cloud3.widthAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
