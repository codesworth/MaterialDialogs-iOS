//
//  ListCell.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 20/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


class ListCell:UITableViewCell{
    
    var iconView:UIView = {
        return UIView(frame: .zero)
        
    }()
    
    var lable:HeaderLabel = {
        let lable = HeaderLabel(frame: .zero)
        lable.font = .systemFont(ofSize: 16, weight: .medium)
        lable.textColor = .darkText
    }()
    
    override var reuseIdentifier: String?{
        return "\(ListCell.self)"
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(iconView)
        addSubview(lable)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            iconView.widthAnchor.constraint(equalToConstant: 30),
            lable.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        
        
        
    }
    
}
