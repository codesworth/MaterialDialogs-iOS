//
//  TextInputDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 17/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation



internal class TextInputDialog:UIView{
    
    var textView:TextView = {
        let tf = TextView(frame: .zero)
        tf.adjustsFontForContentSizeCategory = true
        tf.adjustsFontSizeToFitWidth = true
        tf.enablesReturnKeyAutomatically = true
        tf.font = .body
        tf.placeholder = "Enter Here"
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        tf.textColor = .darkText
        tf.textAlignment = .left
        return tf
    }()
    
    private var underline:UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .primary
        return v
    }()
    
    
    internal init(frame: CGRect,placeholder:String? = nil) {
        super.init(frame:frame)
        textView.placeholder = placeholder
        textView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(textView)
        addSubview(underline)
        underline.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor,constant:2),
            underline.topAnchor.constraint(equalTo: textView.bottomAnchor),
            underline.leadingAnchor.constraint(equalTo: leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: trailingAnchor),
            underline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}


extension TextInputDialog:MessageProtocol{
    
    func returnObject() -> Any {
        return textView.text ?? ""
    }
}

extension TextInputDialog:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}





class TextView:UITextField{
    
    var topInset: CGFloat = 5.0
    var bottomInset: CGFloat = 5.0
    var leftInset: CGFloat = 7.0
    var rightInset: CGFloat = 7.0
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
}
