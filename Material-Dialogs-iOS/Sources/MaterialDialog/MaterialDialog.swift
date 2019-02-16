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
        return UIColor(red: 0, green: 102/255, blue: 0, alpha: 1)
    }
}

public class MaterialDialog{
    
    private var view:MaterialView!
    
    private init(dialog:MaterialView){
        view = dialog
    }
    
    public class func basicDialogue(_ title:String = "",body:String,cancelActionTitle:String,actionTitle:String? = nil)->MaterialDialog{
        let height = body.height(withConstrainedWidth: CGRect.nativeFrame.width, font: .body) + 76
        
        let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height))
        let dialog = BasicDialog(frame: frame, actiontitles: (cancelActionTitle,actionTitle))
        dialog.customView.text = body
        dialog.headerlable.text = title
        
        return MaterialDialog(dialog: dialog)
        
    }
    
    
    public func show(){
        let base = BaseDialog()
        base.addSubview(view)
        view.center = base.center
        base.bringSubviewToFront(view)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            view.centerXAnchor.constraint(equalTo: base.centerXAnchor),
//            view.centerYAnchor.constraint(equalTo: base.centerYAnchor)
//            view.heightAnchor.constraint(equalToConstant: view.frame.height),
//
//        ])
        
        OperationQueue.main.addOperation {
            UIApplication.shared.keyWindow?.addSubview(base)
        }
    }
    
    
}


