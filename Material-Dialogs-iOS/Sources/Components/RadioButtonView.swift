//
//  RadioButtonView.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 21/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation

class RadioButtonView:UIView{
    
    var innershapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(innershapeLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        innershapeLayer.path = UIBezierPath(ovalIn: .zero).cgPath
        innershapeLayer.frame.size = 20
        innershapeLayer.position = center
        innershapeLayer.fillColor = UIColor.primary.cgColor
        layer.borderColor = UIColor.primary.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = frame.width / 2
        
    }
}
