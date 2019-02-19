//
//  ProgressiveDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 19/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


internal class ProgressiveDialog:UIView{
    
    
    private var backgroundLayer = CAShapeLayer()
    private var foregroundLayer = CAShapeLayer()
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
    
    var progressStroke:CGFloat{
        didSet{
            let perc = Int(progressStroke * 100)
            endlable.text = "\(perc)%"
            foregroundLayer.strokeEnd = progressStroke
        }
    }
    
    var endlable:UILabel = {
        var startValueLbale:UILabel = {
            let l = UILabel()
            l.textAlignment = .left
            l.textColor = .primary
            l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            l.backgroundColor = .clear
            l.allowsDefaultTighteningForTruncation = true
            l.minimumScaleFactor = 0.3
            l.numberOfLines  = 1
            return l
        }()
    }
    
    var progressView:UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .clear
        
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        progressView.layer.addSublayer(backgroundLayer)
        progressView.layer.addSublayer(foregroundLayer)
        addSubview(progressView)
        foregroundLayer.strokeEnd = 0
        addSubview(startValueLbale)
        addSubview(endlable)
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayer(layer: backgroundLayer)
        backgroundLayer.strokeColor = UIColor(red: 0, green: 102/255, blue: 0, alpha: 0.5).cgColor
        buildLayer(layer: foregroundLayer)
        foregroundLayer.strokeColor = UIColor.primary.cgColor
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        startValueLbale.translatesAutoresizingMaskIntoConstraints = false
        endlable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant:20),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            startValueLbale.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 6),
            startValueLbale.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            endlable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            endlable.topAnchor.constraint(equalTo: progressView.topAnchor)
            
        ])
    }
    
    func buildLayer(layer: CAShapeLayer) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.height/3))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
        layer.path = path.cgPath
        layer.lineWidth = 20
        layer.fillColor = nil
        layer.lineCap = kCALineCapRound
    }
}
