//
//  ProgressInfiniteDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 20/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


internal class ProgressInfiniteDialog:UIView{
    
    
    var backgroundArc = ArchLayer(color: UIColor(red: 0, green: 102/255, blue: 0, alpha: 0.35), startAngle: 0, endAngle: CGFloat.pi * 2)
    var forgroundArc = ArchLayer(color: .primary, startAngle: .Angle(135), endAngle: .Angle(45))
    var animationview:UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .white
    }()
    
    var extradetails:HeaderLabel = {
        let lab = HeaderLabel(frame: .zero)
        lab.font = .body
        lab.textColor = .darkText
    }()
    override init(frame: CGRect) {
        super.init()
        addSubview(animationview)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
}


fileprivate class ArchLayer:CAShapeLayer{
    
    
    init(color:UIColor,startAngle:CGFloat,endAngle:CGFloat){
        super.init()
        strokeColor = color.cgColor
        lineWidth = 20
        fillColor = nil
        lineCap = kCALineCapRound
        self.startAngle = startAngle
        self.endAngle = endAngle
        
    }
    
    
    private var startAngle:CGFloat
    private var endAngle:CGFloat
    
    
    override var bounds: CGRect{
        didSet{
            buildLayer()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    func buildLayer() {
        let startAngle = startAngle
        let endAngle = endAngle
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = bounds.width * 0.35
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        //    path.move(to: CGPoint(x: 0, y: bounds.height/3))
        //    path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
        self.path = path.cgPath
        position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}


