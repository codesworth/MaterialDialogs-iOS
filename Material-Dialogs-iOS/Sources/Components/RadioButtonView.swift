//
//  RadioButtonView.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 21/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class RadioButtonView:UIView{
    
    var innershapeLayer = CAShapeLayer()
    var gcolor:CGColor!
    init(frame: CGRect, color:UIColor) {
        super.init(frame: frame)
        layer.addSublayer(innershapeLayer)
       self.gcolor = color.cgColor
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        innershapeLayer.zPosition = 100
        innershapeLayer.path = UIBezierPath(ovalIn: [0,20]).cgPath
        //innershapeLayer.frame.size = 20
        innershapeLayer.position = [bounds.midX / 3,bounds.midY / 3]
        innershapeLayer.fillColor = UIColor.clear.cgColor
        layer.borderColor = gcolor
        layer.borderWidth = 2
        layer.cornerRadius = frame.width / 2
        
    }
}
