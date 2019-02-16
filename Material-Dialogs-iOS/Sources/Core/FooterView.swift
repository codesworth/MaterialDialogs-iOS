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
        butt.setTitle("", for: .normal)
        butt.backgroundColor = .primary
        return butt
    }()
    
    
    func setCancel(title:String?){
        if let title = title{
            cancelbutton.setTitle(title, for: .normal)
            cancelbutton.isHidden = false
            cancelbutton.isEnabled = true
            return
        }
        cancelbutton.isHidden = true
        cancelbutton.isEnabled = false
    }
    
    
    func setAction(title:String?){
        if let title = title{
            cancelbutton.setTitle(title, for: .normal)
            cancelbutton.isHidden = false
            cancelbutton.isEnabled = true
            return
        }
        cancelbutton.isHidden = true
        cancelbutton.isEnabled = false
    }
    
    
    
    var cancelbutton:UIButton = {
        let butt = UIButton()
        butt.setTitle("", for: .normal)
        butt.backgroundColor = .primary
        return butt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        cancelbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           cancelbutton.trailingAnchor.constraint(equalTo: trailingAnchor),
            cancelbutton.bottomAnchor.constraint(equalTo: bottomAnchor),
            cancelbutton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.trailingAnchor.constraint(equalTo: cancelbutton.leadingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
