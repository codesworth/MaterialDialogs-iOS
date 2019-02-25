//
//  DialogCells.swift
//  ExampleApp
//
//  Created by Shadrach Mensah on 25/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class DialogCells: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
    }
    
    init(name:String) {
        super.init(style: .default, reuseIdentifier: "\(DialogCells.self)")
        textLabel?.text = name
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override var reuseIdentifier: String?{
        return "\(DialogCells.self)"
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
