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
    
    public enum ActionType{
        case affirm
        case cancel
    }
    public typealias MaterialAction = (_ action:ActionType) -> ()
    
    private var view:MaterialView!
    private var base:BaseDialog!
    
    private init(dialog:MaterialView){
        view = dialog
    }
    
    public class func basicDialogue(_ title:String = "",body:String,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        let height = body.height(withConstrainedWidth: CGRect.nativeFrame.width, font: .body) + 100
        
        let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height))
        let dialog = BasicDialog(frame: frame, actiontitles: (cancelActionTitle,actionTitle))
        dialog.customView.text = body
        dialog.headerlable.text = title
        let mat = MaterialDialog(dialog: dialog)
        mat.completion = completion
        dialog.footer.actionDelegate = mat
        
        return mat
    }
    
    var completion:MaterialAction?
    
    
    
    public func show(){
        
        base = BaseDialog()
        base.addSubview(view)
        view.center = base.center.offsetY(50)
        base.bringSubviewToFront(view)
        
        OperationQueue.main.addOperation {
            UIApplication.shared.keyWindow?.addSubview(self.base)
        }
    }
    
    func animateOut(){
        base.removeFromSuperview()
    }
    
    
}



extension MaterialDialog:DialogActions{
    
    func didPressAffirmative() {
        completion?(.affirm)
        defer {
            OperationQueue.main.addOperation {self.animateOut()}
        }
    }
    
    func didPressCancel() {
        completion?(.cancel)
        defer {
            OperationQueue.main.addOperation {self.animateOut()}
        }
    }
}



extension CGPoint{
    
    func offsetY(_ value:CGFloat)->CGPoint{
        return CGPoint(x: x, y: y - value)
    }
}


