//
//  HeaderLabel.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit



internal class HeaderLabel:UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func customSetup(){
        textAlignment = .left
        textColor = .darkText
        font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backgroundColor = .clear
        allowsDefaultTighteningForTruncation = true
        minimumScaleFactor = 0.3
        numberOfLines  = 1
    }
    
    
}




