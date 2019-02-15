//
//  MaterialDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

extension UIColor{
    class var primary:UIColor{
        return UIColor(red: 0, green: 102, blue: 0, alpha: 1)
    }
}

public class MaterialDialog{
    
    private var view:MaterialView!
    
    private init(dialog:MaterialView){
        view = dialog
    }
    
    class func basicDialogue(_ title:String = "",body:String,negativeActionTitle:String,positiveActionTitle:String? = nil)->MaterialDialog{
        let base = BaseDialog()
        let height = body.height(withConstrainedWidth: nativeFrame.width, font: .body) + 70
        
        let frame = CGRect(origin: .zero, size: CGSize(width: nativeFrame.width, height: height))
        let dialog = BasicDialog(frame: frame)
        dialog.customView.text = body
        dialog.headerlable.text = title
        dialog.footer.negativeButton.setTitle(negativeActionTitle, for: .normal)
        dialog.footer.positiveButton.setTitle(positiveActionTitle, for: .normal)
        return MaterialDialog(dialog: dialog)
        
    }
    
    
    public func show(){
        
    }
    
    
}


