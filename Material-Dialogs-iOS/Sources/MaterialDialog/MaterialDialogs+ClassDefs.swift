//
//  MaterialDialogs+ClassDefs.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation



extension MaterialDialog{
    
    public class func textInputDialog(title:String,placeholder:String?,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        
        return Builder.textInputDialog(title:title,placeholder:placeholder,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
    
    
    public class func basicDialogue(_ title:String,body:String,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        return Builder.basicDialogue(_:title,body:body,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
}
