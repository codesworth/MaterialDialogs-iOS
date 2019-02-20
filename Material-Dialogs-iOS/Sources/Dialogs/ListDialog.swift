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
    
    
    var listSource:[String] = []{
        didSet{
           setup()
        }
    }
    var lisType:MaterialDialog.ListType = .singleChoice
    var selectedObject = -1
    var selectedIndices:IndexSet = []
    
    internal init(frame: CGRect, listType:MaterialDialog.ListType) {
        super.init(frame: frame)
        self.lisType = listType
        addSubview(tableView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


extension ListDialog:UITableViewDataSource,UITableViewDelegate{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(ListCell.self)", for: indexPath) as? ListCell{
            cell.lable.text = listSource[indexPath.row]
            return cell
        }
        let cell = ListCell(style: .default, reuseIdentifier: "\(ListCell.self)")
        cell.lable.text = listSource[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch lisType {
        case .singleChoice:
             selectedObject = indexPath.row
            break
        case .multipleChoice:
            selectedIndices.insert(indexPath.row)
            break
        }
    }
}


extension ListDialog:MessageProtocol{
    
    func returnObject() -> Any {
        switch lisType {
        case .singleChoice:
            return selectedObject
            
        case .multipleChoice:
            return selectedIndices
            
        }
    }
}
