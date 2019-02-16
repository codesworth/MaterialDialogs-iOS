//
//  Fonts+Extension.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


extension UIFont{
    
    class var body:UIFont{
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    class var buttons:UIFont{
        return .systemFont(ofSize: 16, weight: .medium)
    }
}
