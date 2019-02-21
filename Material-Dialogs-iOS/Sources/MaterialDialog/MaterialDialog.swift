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
        case affirm(Any)
        case cancel
    }
    
    public enum OptionsAccessoryType{
        case radio
        case checkbox
    }
    
    public enum ListType{
        case singleChoice
        case multipleChoice
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
    
    internal func build(_ withFooter:Bool = true){
        base = BaseDialog()
        let height = withFooter ? contentView.frame.height + 100 : contentView.frame.height + 60
        let contentHeight:CGFloat
        let backbone:MaterialView
        if  height > CGRect.allowableHeight{
           backbone = MaterialView(frame: CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: CGRect.allowableHeight)))
            contentHeight = CGRect.allowableHeight - 100
        }else{
            backbone = MaterialView(frame: CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: height)))
            contentHeight = contentView.frame.height
        }
        
        backbone.addSubview(header)
        backbone.addSubview(contentView)
        backbone.addSubview(footer)
        header.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let constraintsWF = [
            header.heightAnchor.constraint(equalToConstant: 20),
            header.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 16),
            header.topAnchor.constraint(equalTo: backbone.topAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -16),
            contentView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            contentView.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 12),
            contentView.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -12),
            contentView.heightAnchor.constraint(equalToConstant: contentHeight),
            footer.bottomAnchor.constraint(equalTo: backbone.bottomAnchor, constant: -8),
            footer.leadingAnchor.constraint(equalTo: backbone.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant:-16),
            footer.heightAnchor.constraint(equalToConstant: 30)
        ]
        let constraintsNF = [
            header.heightAnchor.constraint(equalToConstant: 20),
            header.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 16),
            header.topAnchor.constraint(equalTo: backbone.topAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -16),
            contentView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            contentView.leadingAnchor.constraint(equalTo: backbone.leadingAnchor, constant: 12),
            contentView.trailingAnchor.constraint(equalTo: backbone.trailingAnchor, constant: -12),
            contentView.heightAnchor.constraint(equalToConstant: contentHeight),
        ]
        
        
        NSLayoutConstraint.activate(withFooter ? constraintsWF : constraintsNF)
        base.addSubview(backbone)
        backbone.center = base.center
        
    }
    
    
    
    
    
    public func show(){
        if let dialog = contentView as? ProgressInfiniteDialog{
            dialog.beginAnimation()
        }
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
        var message:Any = false
        if let contentView = contentView as? MessageProtocol{
            message = contentView.returnObject()
        }
        completion?(.affirm(message))
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






