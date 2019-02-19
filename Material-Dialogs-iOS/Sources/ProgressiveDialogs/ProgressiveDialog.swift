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
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayer(layer: backgroundLayer)
        backgroundLayer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
        buildLayer(layer: foregroundLayer)
        foregroundLayer.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        startValueLbale.translatesAutoresizingMaskIntoConstraints = false
        endlable.translatesAutoresizingMaskIntoConstraints = false
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
