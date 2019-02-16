//
//  BasicDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class BasicDialog:MaterialView{
    
    typealias FooterActions = (cancel:String?,action:String?)
    var headerlable:HeaderLabel = {
        return HeaderLabel(frame: .zero)
        
    }()
    
    var footer:FooterView!
    var customView:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    var cancelbutton:UIButton = {
        let butt = UIButton()
        butt.setTitle("Dismiss", for: .normal)
        butt.setTitleColor(.green, for: .normal)
        return butt
    }()
    
    
    internal init(frame: CGRect,actiontitles:FooterActions) {
        super.init(frame: frame)
        clipsToBounds = true
        footer = FooterView(cancelTitle: actiontitles.cancel, actionTitle: actiontitles.action)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubview(headerlable)
        addSubview(customView)
        addSubview(cancelbutton)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        headerlable.translatesAutoresizingMaskIntoConstraints = false
        cancelbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerlable.heightAnchor.constraint(equalToConstant: 20),
            headerlable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerlable.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headerlable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            customView.topAnchor.constraint(equalTo: headerlable.bottomAnchor, constant: 8),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            cancelbutton.bottomAnchor.constraint(equalTo:bottomAnchor, constant: 0),
            cancelbutton.widthAnchor.constraint(equalToConstant: 80),
            cancelbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-16),
            cancelbutton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
