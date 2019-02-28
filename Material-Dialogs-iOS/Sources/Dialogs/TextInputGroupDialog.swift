//
//  TextInputGroupDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class TextInputGroupDialog:UIView{
    
    var inputChildren:[TextInputDialog]!
    var placeholders:[String?]?
    var inputCount:Int = 0
    var contentTypes:[UITextContentType]?
    var parentStack:UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    internal init(frame: CGRect, inputNumber:Int, placeholders:[String?]?, contentTypes:[UITextContentType]?) {
        super.init(frame: frame)
        inputCount = inputNumber
        self.placeholders = placeholders
        self.contentTypes = contentTypes
        inputChildren = []
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        parentStack.frame = frame
        var i = 0
        while i < inputCount{
            let ipg:TextInputDialog
            if placeholders != nil{
                if i < placeholders!.count{
                    let placeholder = placeholders![i]
                    let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 40))
                    ipg = TextInputDialog(frame: frame, placeholder: placeholder)
                    if let styles = contentTypes, i < styles.count{
                        let style = styles[i]
                        ipg.textView.textContentType = style
                    }
                }else{
                    let placeholder = placeholders![i]
                    let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 40))
                    ipg = TextInputDialog(frame: frame, placeholder: placeholder)
                    if let styles = contentTypes, i < styles.count{
                        let style = styles[i]
                        ipg.textView.textContentType = style
                    }
                }
            }else{
                let frame = CGRect(origin: .zero, size: CGSize(width: CGRect.fixedWidth, height: 40))
                ipg = TextInputDialog(frame: frame, placeholder: nil)
                if let styles = contentTypes, i < styles.count{
                    let style = styles[i]
                    ipg.textView.textContentType = style
                }
            }
            inputChildren.append(ipg)
            i += 1
        }
        
        for ipg in inputChildren{
            parentStack.addArrangedSubview(ipg)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(parentStack)
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            parentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            parentStack.topAnchor.constraint(equalTo: topAnchor),
            parentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}



extension TextInputGroupDialog:MessageProtocol{
    func returnObject() -> Any {
        let inputs = inputChildren.map{return $0.textView.text ?? ""}
        return inputs
    }
    
}


extension TextInputGroupDialog:ColorAdaptable{
    
    func mutateColor(color: UIColor) {
        inputChildren.forEach{($0 as ColorAdaptable).mutateColor(color: color)}
    }
}
