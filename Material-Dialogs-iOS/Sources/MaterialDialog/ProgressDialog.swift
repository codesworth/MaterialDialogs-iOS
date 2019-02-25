//
//  ProgressDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 19/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

public final class ProgressDialog:MaterialDialog{
    
    var progressiveDialog:ProgressiveDialog?
    
    override init(dialog: UIView) {
        super.init(dialog: dialog)
        guard let prog = dialog as? ProgressiveDialog else {return}
        progressiveDialog = prog
    }
    
    override func build(_ withFooter:Bool = true) {
        super.build(withFooter)
    }
    
    public func updateWith(progressValue:CGFloat){
        
        progressiveDialog?.progressStroke = progressValue
    }
}
