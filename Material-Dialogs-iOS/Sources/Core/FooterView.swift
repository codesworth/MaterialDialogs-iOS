//
//  FooterView.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

internal class FooterView:UIView{
    
    var positiveButton:UIButton = {
        let butt = UIButton()
        butt.setTitle("", for: .normal)
        butt.backgroundColor = .primary
        return butt
    }()
    
    
    
    
    var negativeButton:UIButton = {
        let butt = UIButton()
        butt.setTitle("", for: .normal)
        butt.backgroundColor = .primary
        return butt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        let stack = UIStackView(arrangedSubviews: [positiveButton,negativeButton])
        
        stack.alignment = .trailing
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: 40),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.1)
        ])
    }
}
