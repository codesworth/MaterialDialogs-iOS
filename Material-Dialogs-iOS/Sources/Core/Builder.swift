//
//  Builder.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


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
}
