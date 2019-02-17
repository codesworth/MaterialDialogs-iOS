//
//  BasicDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


internal class BasicDialog:UIView{
    
    typealias FooterActions = (cancel:String?,action:String?)
    var headerlable:HeaderLabel = {
        return HeaderLabel(frame: .zero)
        
    }()
    
    var footer:FooterView!
    var customView:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .darkText
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        customView.frame = frame
        addSubview(customView)
        
//        customView.translatesAutoresizingMaskIntoConstraints = false
//        headerlable.translatesAutoresizingMaskIntoConstraints = false
//        footer.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            headerlable.heightAnchor.constraint(equalToConstant: 20),
//            headerlable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            headerlable.topAnchor.constraint(equalTo: topAnchor, constant: 16),
//            headerlable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            customView.topAnchor.constraint(equalTo: headerlable.bottomAnchor, constant: 8),
//            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
//            footer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
//            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-16),
//            footer.heightAnchor.constraint(equalToConstant: 30)
//        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



