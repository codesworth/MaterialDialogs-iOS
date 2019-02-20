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
    
    public class func textInputGroupDialog(title:String,numberOfInputs:Int,placeholders:[String?]?,inputTextContentTypes:[UITextContentType]?,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialDialog.MaterialAction?)->MaterialDialog
    {
        return Builder.textInputGroupDialog(title:title,numberOfInputs:numberOfInputs,placeholders:placeholders,inputTextContentTypes:inputTextContentTypes,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle, completion:completion)
    }
    
    
    public class func progressiveDialog(title:String?,completion:MaterialDialog.MaterialAction?)-> ProgressDialog{
        return Builder.progressiveDialog(title:title,completion:completion)
    }
    
    public class func progressDialog(title:String?, info:String?, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        
        return Builder.progressDialog(title:title,info:info,completion:completion)
    }
}
