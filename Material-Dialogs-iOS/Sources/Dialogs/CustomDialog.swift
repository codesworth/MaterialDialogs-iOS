//
//  CustomDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 22/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


public class CustomDialog:UIView,MessageProtocol{
    
    public typealias DialogAction = () -> Any
    
    var selector:DialogAction?
    func returnObject() -> Any {
        return selector?() ?? true
    }
    
    
    
    public init(view:UIView, action:DialogAction?){
        super.init(frame: view.frame)
        self.addSubview(view)
        self.selector  = action
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
