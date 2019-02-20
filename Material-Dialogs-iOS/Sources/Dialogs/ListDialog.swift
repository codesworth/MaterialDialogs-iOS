//
//  ListDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 20/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


class ListDialog:UIView{
    
    var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsMultipleSelection = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        return tableView
    }()
    
    
    var listSource:[String]{
        didSet{
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //let tabHeight = listSource.count * 40
        //let height:CGFloat = CGFloat(tabHeight) < CGRect.allowableHeight ? CGFloat(tabHeight) : CGRect.allowableHeight
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
