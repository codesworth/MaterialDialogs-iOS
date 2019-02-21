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
        tableView.register(ListCell.self, forCellReuseIdentifier: "\(ListCell.self)")
        
        

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
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        tableView.separatorStyle = .none
        //setScrolling()
        if tableView.contentSize.height > CGRect.allowableHeight{
            tableView.isScrollEnabled = false
            tableView.showsVerticalScrollIndicator = false
        }else{
            tableView.isScrollEnabled = true
            tableView.showsVerticalScrollIndicator = true
        }
    }
    
    func setScrolling(){
        if CGFloat((listSource.count * 40))  < CGRect.allowableHeight{
            tableView.isScrollEnabled = false
            tableView.showsVerticalScrollIndicator = false
        }else{
            tableView.isScrollEnabled = true
            tableView.showsVerticalScrollIndicator = true
        }
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
            cell.radioType = .radio
            cell.lable.text = listSource[indexPath.row]
            return cell
        }
        let cell = ListCell(style: .default, reuseIdentifier: "\(ListCell.self)")
        cell.lable.text = listSource[indexPath.row]
        cell.radioType = .radio
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
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
