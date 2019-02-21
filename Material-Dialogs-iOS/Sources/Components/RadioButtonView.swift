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
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        innershapeLayer.path = UIBezierPath(ovalIn: .zero)
        innershapeLayer.frame.size = CGSize(width: 30, height: 30)
    }
}
