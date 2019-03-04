//
//  ProgressiveDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 19/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class ProgressiveDialog:UIView{
    
    
    private var backgroundLayer = CAShapeLayer()
    private var foregroundLayer = CAShapeLayer()
    private var strokeColor:UIColor = .primary
    var startValueLbale:UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .darkText
        l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        l.backgroundColor = .clear
        l.allowsDefaultTighteningForTruncation = true
        l.text = "0%"
        l.minimumScaleFactor = 0.3
        l.numberOfLines  = 1
        return l
    }()
    
    var progressStroke:CGFloat = 0{
        didSet{
            let perc = min(1, progressStroke)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 0.5
            let percl = Int(perc * 100)
            foregroundLayer.strokeEnd = perc
            foregroundLayer.add(animation, forKey: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {self.endlable.text = "\(percl)%"})
        }
    }
    
    var endlable:UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .primary
        l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        l.backgroundColor = .clear
        l.allowsDefaultTighteningForTruncation = true
        l.text = "0%"
        l.minimumScaleFactor = 0.3
        l.numberOfLines  = 1
        return l
    }()
    
    
    var progressView:UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .clear
        return v
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        progressView.layer.addSublayer(backgroundLayer)
        progressView.layer.addSublayer(foregroundLayer)
        addSubview(progressView)
        foregroundLayer.strokeEnd = 0
        addSubview(startValueLbale)
        addSubview(endlable)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayer(layer: backgroundLayer)
        backgroundLayer.strokeColor = strokeColor.withAlphaComponent(0.20).cgColor
        buildLayer(layer: foregroundLayer)
        foregroundLayer.strokeColor = strokeColor.cgColor
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        startValueLbale.translatesAutoresizingMaskIntoConstraints = false
        endlable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant:20),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            startValueLbale.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            startValueLbale.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            endlable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            endlable.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant:10)
            
        ])
    }
    
    func buildLayer(layer: CAShapeLayer) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: progressView.bounds.height/3))
        path.addLine(to: CGPoint(x: progressView.bounds.width - 6, y: progressView.bounds.height/3))
        layer.path = path.cgPath
        layer.lineWidth = 10
        layer.fillColor = nil
        layer.lineCap = .round
    }
    
}

extension ProgressiveDialog:MessageProtocol{
    
    func returnObject() -> Any {
        return true
    }
}


extension ProgressiveDialog:ColorAdaptable{
    
    func mutateColor(color: UIColor) {
        endlable.textColor = color
        startValueLbale.textColor = color
        strokeColor = color
    }
}
