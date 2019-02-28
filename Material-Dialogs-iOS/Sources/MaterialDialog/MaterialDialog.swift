//
//  MaterialDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


/** MaterialDialogs-ios is a library of dialogs using material design
 * All dialogs are created with a specified class method.
 * Dialog method show() has to be called in order for dialog to appear on the screen
 * All dialogs return an object upon dismissal Check output object type depending on the class init method used
 * **Do** not subclass MaterialDialog: Use MaterialDialog.customView instead**
 */
public class MaterialDialog{
    
    /**
     * Sets A global Color Tint for All Dialogs.
     * Paramter color: UIColor - color to set default tint to
     */
    public func setGlobalTint(_ color:UIColor){
        footer.actionButton.setTitleColor(color, for: .normal)
        footer.cancelbutton.setTitleColor(color, for: .normal)
        if let contentView  = contentView as? ColorAdaptable{
            contentView.mutateColor(color: color)
            if let list = self.contentView as? ListDialog{
                list.tableView.reloadData()
            }
            
        }
    }
    
    public typealias MaterialAction = (_ action:ActionType) -> ()
    
    /** Action types denoted by two buttons in the footer of a dialog.
     Cases Includes :
     - affirm(Any) - When a confirm or affirmative button is presssed, passes in a value of Any. Each dialog type is responsible for its return value and does so by conforming to MessageProtocol and implementing MessageProtocol.returnObject
     - cancel - When a Cancel or Dismiss button is pressed, this notifies the user the dialog was removed from view
    */
    
    public enum ActionType{
        case affirm(Any)
        case cancel
    }
    
    /** OptionsAccessoryType denotes icon types used by ListDialogs.
     Cases Includes :
     - radio - Uses a radio button to identify list selections
     - checkbox - Uses checkbox to identify list selections
     */
    
    public enum OptionsAccessoryType{
        case radio
        case checkbox
    }
    
    var backbone:MaterialView!
    
    /** ListType denotes ListDialogs selections type.
     Cases Includes :
     - singleChoice - only one item can be selected
     - multipleChoice - allows selection of multiple items
     */
    
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
    
    
    func watchForKeyBoardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(respondtoKeyBoard), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func deregisterNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    @objc func respondtoKeyBoard(_ notification: Notification){
        //Calculate lenght to bottom of screen
        let lengthToBottom = (UIScreen.main.bounds.height / 2) - ((backbone.bounds.height / 2) + 10)
        let keyBoardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if keyBoardFrame.height > lengthToBottom{
            backbone.center = backbone.center.offsetY((keyBoardFrame.height - lengthToBottom) + 10)
        }
    }
    
    /**
     Displays the referenced dialog in the apps keyWindow
     */
    public func show(){
        watchForKeyBoardNotifications()
        if let dialog = contentView as? ProgressInfiniteDialog{
            dialog.beginAnimation()
        }
        OperationQueue.main.addOperation {
            UIApplication.shared.keyWindow?.addSubview(self.base)
        }
    }
    
    /**
     Removes the referenced dialog in the apps keyWindow. this is automatically called in either action buttons. This should only be called in the use of footerless Infinite Progress Dialogs
     */
    public func cancel(){
        didPressCancel()
    }
    
    func animateOut(){
        base.removeFromSuperview()
        deregisterNotification()
    }
    /**
     *Fixed width for the entire Material Dialog. See MaterialDialog.fixedCustomWidth if you are making a custom dialog. value = 90% of the UIScreen.bounds.width
     */
    public static var fixedWidth:CGFloat{
        return CGRect.fixedWidth
    }
    
    /**
    *Fixed width for the entire Content View of dialog. All Custom dialogs must use this width to prevent misalignments.
    */
    public static var fixedCustomViewWidth:CGFloat{
        return fixedWidth - 24
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






