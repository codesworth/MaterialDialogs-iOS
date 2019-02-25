//
//  CGRect+Extension.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit



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


extension CGPoint{
    
    func offsetY(_ value:CGFloat)->CGPoint{
        return CGPoint(x: x, y: y - value)
    }
}



extension CGFloat{
    
    static func Angle(_ degree:CGFloat)-> CGFloat{
        return (.pi * degree) / 180
    }
}
