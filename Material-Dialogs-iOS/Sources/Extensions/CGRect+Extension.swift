//
//  CGRect+Extension.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation



extension CGRect{
    
    static var nativeFrame:CGRect{
        return UIScreen.main.bounds
    }
    
    static var fixedWidth:CGFloat{
        return nativeFrame.width * 0.9
    }
    
    static var allowableHeight:CGFloat{
        return nativeFrame.height * 0.8
    }
}

