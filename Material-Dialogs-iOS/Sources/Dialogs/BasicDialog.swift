//
//  BasicDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class BasicDialog:UIView{
    
    
    var customView:UIView!
    
    private var textlable:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .darkText
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    var textView:UITextView = {
        let textview = UITextView(frame: .zero)
        textview.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textview.textAlignment = .left
        return textview
    }()
    private var text:String = ""
    
    internal init(frame: CGRect, text:String) {
        super.init(frame: frame)
        self.text = text
        let height = text.height(withConstrainedWidth: CGRect.fixedWidth, font: .body)
        if height > CGRect.allowableHeight{
            textView.text = text
            customView = textView
        }else{
            textlable.text = text
            customView = textlable
            
        }
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: topAnchor),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



extension BasicDialog:MessageProtocol{
    
    func returnObject() -> Any {
        return true
    }
    
    
    
}

