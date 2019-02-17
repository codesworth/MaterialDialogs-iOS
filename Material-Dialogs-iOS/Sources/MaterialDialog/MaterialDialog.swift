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
    
    public typealias MaterialAction = (_ action:ActionType) -> ()
    public enum ActionType{
        case affirm
        case cancel
    }
    
    
    
    internal var header:HeaderLabel = {
        return HeaderLabel(frame: .zero)
    }()
    
    var completion:MaterialAction?
    var contentView:UIView!
    private var base:BaseDialog!
    
    internal var footer:FooterView!{
        didSet{
            footer.actionButton.addTarget(self, action: #selector(didPressAffirmative), for: .touchUpInside)
            footer.cancelbutton.addTarget(self, action: #selector(didPressCancel), for: .touchUpInside)
        }
    }
    
    internal init(dialog:UIView){
       contentView = dialog
    }
    
    
    public class func basicDialogue(_ title:String,body:String,cancelActionTitle:String,actionTitle:String? = nil, completion:MaterialAction?)->MaterialDialog{
        return Builder.basicDialogue(_:title,body:body,cancelActionTitle:cancelActionTitle,actionTitle:actionTitle,completion:completion)
    }
    
    
    internal func build(){
        base = BaseDialog()
        let backbone = MaterialView()
        let height = contentView.frame.height + 100
        if  height > CGRect.allowableHeight{
           
            return
        }
        backbone.frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height))
        backbone.addSubview(header)
        backbone.addSubview(contentView)
        backbone.addSubview(footer)
        header.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 20),
            header.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 16),
            header.topAnchor.constraint(equalTo: backbone.topAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -16),
            contentView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            contentView.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 12),
            contentView.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -12),
            footer.bottomAnchor.constraint(equalTo: backbone.bottomAnchor, constant: -8),
            footer.leadingAnchor.constraint(equalTo: backbone.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant:-16),
            footer.heightAnchor.constraint(equalToConstant: 30)
        ])
        base.addSubview(backbone)
        backbone.center = base.center
        
    }
    
    
    
    
    
    public func show(){
        
        OperationQueue.main.addOperation {
            UIApplication.shared.keyWindow?.addSubview(self.base)
        }
    }
    
    func animateOut(){
        base.removeFromSuperview()
    }
    
    
}



extension MaterialDialog{
    
    @objc func didPressAffirmative() {
        completion?(.affirm)
        defer {
            OperationQueue.main.addOperation {self.animateOut()}
        }
    }
    
    @objc func didPressCancel() {
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


