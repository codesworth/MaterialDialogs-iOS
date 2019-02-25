//
//  MaterialDialogs+ClassDefs.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation



extension MaterialDialog{
    /* Create a simple textInput Dialog that takes in text.
     * Parameter title - Title of the alert
     * Paremter placeholder: - A placeholder String for the textField
     * Parameter cancelActionTitle: - A title to display for cancelling Action. Defaults to "DISMISS"
     * Paramter  actionTitle: - title to display uppon affirming the action. nil action title removes affirmative action option from the dialog.
     * Parameter completion: a completion block that supplies an argument of ActionType undertakedn upon dismissal of the dialog.  MaterialAction completion ((_ action:ActionType)->())
     * ActionType includes two cases 1. An Affim case that returns the text the user typed into the input (String), 2. A cancel case that returns no Action
     * */
    public class func textInputDialog(title:String,placeholder:String?,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        
        return Builder.textInputDialog(title:title,placeholder:placeholder,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
    
    /* Create a basic Dialog. Displays text and receives an action.
     * Parameter title - Title of the alert
     * Paremter body: - The message to be diplayed to user
     * Parameter cancelActionTitle: - A title to display for cancelling Action. Defaults to "DISMISS"
     * Paramter  actionTitle: - title to display uppon affirming the action. nil action title removes affirmative action option from the dialog.
     * Parameter completion: a completion block that supplies an argument of ActionType undertakedn upon dismissal of the dialog.  MaterialAction completion ((_ action:ActionType)->())
     * ActionType includes two cases 1. An Affim case that returns true (Bool) indicating user confirmed, 2. A cancel case that returns no Action
     * */
    public class func basicDialogue(_ title:String,body:String,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        return Builder.basicDialogue(_:title,body:body,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
    
    /* Create a textInput Group. Input Group Stacked vertically.
     * Parameter title - Title of the alert
     * Paremter numberOfInputs: - The number of input textFields to display
     * Paramter placeholders: An array of placeholders to diplay in corresponding textDialog
     * Paramter inputTextContentTypes: An array of UITextContentTypes for the corresponding textDialog
     * Parameter cancelActionTitle: - A title to display for cancelling Action. Defaults to "DISMISS"
     * Paramter  actionTitle: - title to display uppon affirming the action. nil action title removes affirmative action option from the dialog.
     * Parameter completion: a completion block that supplies an argument of ActionType undertaken upon dismissal of the dialog.  MaterialAction completion ((_ action:ActionType)->())
     * ActionType includes two cases 1. An Affim case that returns an Array of the text in each input Array<String>, 2. A cancel case that returns no Action
     * */
    
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
    
    public class func listDialog(title:String?,list type:MaterialDialog.ListType, choices:[String],cancelActionTitle:String = "CANCEL",actionTitle:String = "COMFIRM", completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        return Builder.listDialog(title:title,list:type,choices:choices,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
    
    public class func customDialog(title:String?,customview:CustomDialog,cancelActionTitle:String = "CANCEL",actionTitle:String = "COMFIRM",withFooter:Bool, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        
        return  Builder.customDialog(title:title,customview:customview,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,withFooter:withFooter,completion:completion)
    }
}
