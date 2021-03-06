//
//  Builder.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit




internal class Builder{
    
    class func basicDialogue(_ title:String,body:String,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        let height = body.height(withConstrainedWidth: CGRect.nativeFrame.width, font: .body)
        let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height))
        let dialog = BasicDialog(frame: frame, text:body)
        let mat = MaterialDialog(dialog: dialog)
        mat.header.text = title
        let footer = FooterView(cancelTitle: cancelActionTitle, actionTitle: actionTitle)
        mat.footer = footer
        mat.completion = completion
        mat.build()
        
        return mat
    }
    
    
    class func textInputDialog(title:String,placeholder:String?,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 45))
        let inputDialog = TextInputDialog(frame: frame, placeholder: placeholder)
        let mat = MaterialDialog(dialog: inputDialog)
        mat.header.text = title
        let footer = FooterView(cancelTitle: cancelActionTitle, actionTitle: actionTitle)
        mat.footer = footer
        mat.completion = completion
        mat.build()
        return mat
    }
    
    class func textInputGroupDialog(title:String,numberOfInputs:Int,placeholders:[String?]?,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialDialog.MaterialAction?)->MaterialDialog
    {
        let height:CGFloat = 40 * CGFloat(numberOfInputs)
        let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height))
        let group = TextInputGroupDialog(frame: frame, inputNumber: numberOfInputs, placeholders: placeholders)
        let mat = MaterialDialog(dialog: group)
        mat.header.text = title
        let footer = FooterView(cancelTitle: cancelActionTitle, actionTitle: actionTitle)
        mat.footer = footer
        mat.completion = completion
        mat.build()
        return mat
    }
    
    class func progressiveDialog(title:String?,completion:MaterialDialog.MaterialAction?)-> ProgressDialog{
        
        let progressive = ProgressiveDialog(frame: CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 60)))
        let pat = ProgressDialog(dialog: progressive)
        pat.header.text = title
        let footer = FooterView(cancelTitle: "CANCEL", actionTitle: nil)
        pat.footer = footer
        pat.completion = completion
        pat.build()
        return pat
        
    }
    
    class func progressDialog(title:String?, info:String?,addCancel:Bool = false, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        
        let progress = ProgressInfiniteDialog(frame: CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 60)))
        progress.setText(text: info)
        let mat = MaterialDialog(dialog: progress)
        mat.header.text = title
        let footer = FooterView(cancelTitle: "CANCEL", actionTitle: nil)
        mat.footer = footer
        mat.completion = completion
        mat.build(addCancel)
        return mat
    }
    
    class func listDialog(title:String?,list type:MaterialDialog.ListType, choices:[String],accessoryType:MaterialDialog.OptionsAccessoryType = .radio,cancelActionTitle:String = "CANCEL",actionTitle:String = "COMFIRM", completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        
        let tabHeight = choices.count * 40
        let height:CGFloat = CGFloat(tabHeight) < CGRect.allowableHeight ? CGFloat(tabHeight) : CGRect.allowableHeight
        let listd = ListDialog(frame: CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height)),listType:type, accessoryType:accessoryType)
        listd.listSource = choices
        let mat = MaterialDialog(dialog: listd)
        mat.header.text = title
        let footer = FooterView(cancelTitle: cancelActionTitle, actionTitle:actionTitle)
        mat.footer = footer
        mat.completion = completion
        mat.build()
        return mat
    }
    
    
    class func customDialog(title:String?,customview:CustomDialog,cancelActionTitle:String = "CANCEL",actionTitle:String = "COMFIRM",withFooter:Bool, completion:MaterialDialog.MaterialAction?)->MaterialDialog{
        
        let fullHeight = customview.frame.height
        precondition(fullHeight + 100 < CGRect.allowableHeight, "Custom Height cannot be higher than predefined dialog height >> \(CGRect.allowableHeight)")
        
        let mat = MaterialDialog(dialog: customview)
        mat.header.text = title
        let footer = FooterView(cancelTitle: cancelActionTitle, actionTitle:actionTitle)
        mat.footer = footer
        mat.completion = completion
        mat.build(withFooter)
        return mat
    }
    
    
}
