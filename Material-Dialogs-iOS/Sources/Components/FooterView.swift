//
//  FooterView.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit



internal class FooterView:UIView{
    
    var actionButton:UIButton = {
        let butt = UIButton()
        butt.setTitleColor(.primary, for: .normal)
        butt.isUserInteractionEnabled = true
        butt.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return butt
    }()
    
    
    private func setCancel(title:String?){
        if let title = title{
            cancelbutton.setTitle(title, for: .normal)
            cancelbutton.isHidden = false
            cancelbutton.isEnabled = true

            return
        }
        cancelbutton.isHidden = true
        cancelbutton.isEnabled = false
    }
    

    
    
    private func setAction(title:String?){
        if let title = title{
            actionButton.setTitle(title, for: .normal)
            actionButton.isHidden = false
            actionButton.isEnabled = true
            
            return
        }
        actionButton.isHidden = true
        actionButton.isEnabled = false
    }
    
    
    
    
    
    var cancelbutton:UIButton = {
        let butt = UIButton()
        butt.setTitle("", for: .normal)
        butt.setTitleColor(.primary, for: .normal)
        butt.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return butt
    }()
    
    internal init(cancelTitle:String? = "Dismiss", actionTitle:String? = nil){
        super.init(frame: .zero)
        setCancel(title: cancelTitle)
        setAction(title: actionTitle)
        isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(cancelbutton)
        addSubview(actionButton)
        
        let cancelwidth = (cancelbutton.title(for: .normal) != nil) ? cancelbutton.title(for: .normal)!.width(withConstrainedHeight: 30, font: .buttons) + 10 : CGFloat(0)
        let actionwidth = (actionButton.title(for: .normal) != nil) ? actionButton.title(for: .normal)!.width(withConstrainedHeight: 30, font: .buttons) + 10 : CGFloat(0)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        cancelbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.widthAnchor.constraint(equalToConstant: actionwidth),
            cancelbutton.trailingAnchor.constraint(equalTo: actionButton.isHidden ? trailingAnchor : actionButton.leadingAnchor, constant: -20),
            cancelbutton.bottomAnchor.constraint(equalTo: bottomAnchor),
            cancelbutton.widthAnchor.constraint(equalToConstant: cancelwidth),
            cancelbutton.heightAnchor.constraint(equalToConstant: 30),
            
            
        ])
    }
}
