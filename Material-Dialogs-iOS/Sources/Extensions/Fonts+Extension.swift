//
//  Fonts+Extension.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation
import UIKit


extension UIFont{
    
    class var body:UIFont{
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    class var buttons:UIFont{
        return .systemFont(ofSize: 16, weight: .medium)
    }
}

extension UIColor{
    class var primary:UIColor{
        return UIColor(red: 0, green: 102/255, blue: 0, alpha: 1)
    }
}
