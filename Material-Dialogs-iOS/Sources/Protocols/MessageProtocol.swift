//
//  MessageProtocol.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

protocol MessageProtocol:class {
    
    func returnObject()->Any
}


protocol ColorAdaptable:class{
    
    func mutateColor(color:UIColor)
}
