//
//  ListCell.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 20/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


class ListCell:UITableViewCell{
    
    var iconView:UIView = {
        return UIView(frame: .zero)
         
    }()
    
    var itemColor:UIColor = .primary
    
    var isPressed:Bool = false
    var configured:Bool = false
    
    var lable:HeaderLabel = {
        let lable = HeaderLabel(frame: .zero)
        lable.font = .systemFont(ofSize: 16, weight: .medium)
        lable.textColor = .darkText
        return lable
    }()
    
    func deselct(){
        if let sub = iconView.subviews.last as? RadioButtonView{
            sub.innershapeLayer.fillColor = UIColor.clear.cgColor
            isPressed = false
        }else if let sub = iconView.subviews.last as? CheckMark{
            sub.layer.backgroundColor = UIColor.white.cgColor
            isPressed = false
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deselct()
    }

    
    override var reuseIdentifier: String?{
        return "\(ListCell.self)"
    }
    
    var radioType:MaterialDialog.OptionsAccessoryType?{
        didSet{
            buildAccessory(type: radioType!)
        }
    }
    
    func buildAccessory(type:MaterialDialog.OptionsAccessoryType){
        if type == .radio{
            let view = RadioButtonView(frame: [0,30])
            iconView.addSubview(view)
            
        }else if type == .checkbox{
            let view = CheckMark(frame: [0,30])
            iconView.addSubview(view)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellPressed(){
        if let sub = iconView.subviews.last as? RadioButtonView{
            if isPressed{
                
                sub.innershapeLayer.fillColor = UIColor.clear.cgColor
                isPressed = false
            }else{
                sub.innershapeLayer.fillColor = itemColor.cgColor
                isPressed = true
                
            }
        }else if let sub = iconView.subviews.last as? CheckMark{
            if isPressed{

                sub.layer.backgroundColor = UIColor.white.cgColor
                
                isPressed = false
            }else{
                sub.layer.backgroundColor = itemColor.cgColor
                
                isPressed = true
                
            }
        }
    }
    
    func setup(){
        addSubview(iconView)
        
        addSubview(lable)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            iconView.widthAnchor.constraint(equalToConstant: 30),
            lable.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.heightAnchor.constraint(equalToConstant: 25)
            
            ])
        
        configured = true
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        if configured{
            return
        }else {
            setup()
        }
        
    }
    
}
