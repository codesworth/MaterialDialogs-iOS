//
//  ProgressInfiniteDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 20/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class ProgressInfiniteDialog:UIView{
    
    
    fileprivate var backgroundArc = ArchLayer(color: UIColor(red: 0, green: 102/255, blue: 0, alpha: 0.35), startAngle: 0, endAngle: CGFloat.pi * 2)
    fileprivate var forgroundArc = ArchLayer(color: .primary, startAngle: .Angle(135), endAngle: .Angle(45))
    var animationview:UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .white
        return v
    }()
    
    var extradetails:HeaderLabel = {
        let lab = HeaderLabel(frame: .zero)
        lab.font = .body
        lab.textColor = .darkText
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame:frame)
        animationview.layer.addSublayer(backgroundArc)
        animationview.layer.addSublayer(forgroundArc)
        addSubview(animationview)
        addSubview(extradetails)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text:String?){
        extradetails.text = text
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        forgroundArc.strokeEnd = 1
        backgroundArc.strokeEnd = 1
        animationview.translatesAutoresizingMaskIntoConstraints = false
        extradetails.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            animationview.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationview.widthAnchor.constraint(equalToConstant: 45),
            animationview.heightAnchor.constraint(equalToConstant: 45),
            extradetails.leadingAnchor.constraint(equalTo: animationview.trailingAnchor, constant: 10),
            extradetails.centerYAnchor.constraint(equalTo: centerYAnchor),
            extradetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            extradetails.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        backgroundArc.bounds = animationview.bounds
        forgroundArc.bounds = animationview.bounds
    }
    
    func beginAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = CGFloat.Angle(360)
        animation.repeatCount = .greatestFiniteMagnitude
        forgroundArc.add(animation, forKey: "progress")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        beginAnimation()
    }
    
    
}

extension ProgressInfiniteDialog:MessageProtocol{
    
    func returnObject() -> Any {
        return true
    }
}

extension ProgressInfiniteDialog:ColorAdaptable{
    
    func mutateColor(color: UIColor) {
        forgroundArc.strokeColor = color.cgColor
        backgroundArc.strokeColor = color.withAlphaComponent(0.35).cgColor
    }
}


fileprivate class ArchLayer:CAShapeLayer{
    
    
    init(color:UIColor,startAngle:CGFloat,endAngle:CGFloat){
        super.init()
        strokeColor = color.cgColor
        lineWidth = 5
        fillColor = nil
        lineCap = CAShapeLayerLineCap.round
        self.startAngle = startAngle
        self.endAngle = endAngle
        
    }
    
    
    private var startAngle:CGFloat = 0
    private var endAngle:CGFloat = 0
    
    
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
        let startAngle = self.startAngle
        let endAngle = self.endAngle
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = bounds.width * 0.35
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        //    path.move(to: CGPoint(x: 0, y: bounds.height/3))
        //    path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
        self.path = path.cgPath
        position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}


