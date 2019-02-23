//
//  CheckMark.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 23/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
@IBDesignable
internal final class CheckMark:UIView{
    
    let bezierPath = UIBezierPath()
    let check = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(check)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCheck(){
        
        bezierPath.move(to: CGPoint(x: 4.5, y: 15.21))
        bezierPath.addLine(to: CGPoint(x: 11.57, y: 22.5))
        bezierPath.addLine(to: CGPoint(x: 26.5, y: 5.5))
        bezierPath.lineCapStyle = .round
        bezierPath.stroke()
        check.path = bezierPath.cgPath
        check.strokeColor = UIColor.white.cgColor
        check.fillColor = UIColor.clear.cgColor
        check.lineWidth = 3
        check.lineCap = .round
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawCheck()
        layer.borderWidth = 1
        layer.borderColor = UIColor.primary.cgColor
        check.backgroundColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.white.cgColor
        
    }
    
    
    
    
}
