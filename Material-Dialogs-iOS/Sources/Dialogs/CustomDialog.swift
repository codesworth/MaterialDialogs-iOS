//
//  CustomDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 22/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation

/**
 * Simple UIView subclass for creating custom views for materialDialogs. This offers ability to introduce user content and handle dialogs differently as you see fit. This class only takes over the contentView of the MaterialDialog and not the whole MaterialDialog. Therefore the dialog header and Footer will still be smae as Default dialog
    Initializer Paramters
 * view: A custom UIView you created. This view must define a valid frame and not have a width greater than MaterialDialog.fixedWidth or there will be clipped out.
 */
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
