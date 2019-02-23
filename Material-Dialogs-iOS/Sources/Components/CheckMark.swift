//
//  CheckMark.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 23/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

internal final class CheckMark:UIView{
    
    let bezierPath = UIBezierPath()
    let check = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 4.5, y: 15.21))
        bezierPath.addLine(to: CGPoint(x: 11.57, y: 22.5))
        bezierPath.addLine(to: CGPoint(x: 26.5, y: 5.5))
        UIColor.white.setStroke()
        bezierPath.lineWidth = 4
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .bevel
        bezierPath.stroke()
        check.path = bezierPath.cgPath
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.backgroundColor = UIColor.white.cgColor
        
    }
    
    
}
