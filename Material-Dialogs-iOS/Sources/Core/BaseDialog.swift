//
//  BaseDialog.swift
//  Material-Dialogs-iOS
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

internal class BaseDialog:UIView{
    
    internal var nativeFrame: CGRect = {
        return .nativeFrame
    }()
    
    private var allowableSize:CGSize{
        return CGSize(width: CGFloat(nativeFrame.width * 0.9), height: CGFloat(nativeFrame.height * 0.8))
    }
    
    private var overlay:UIView = {
        let overlay = UIView.init(frame: .zero)
        overlay.backgroundColor = .lightGray
        overlay.alpha = 0.7
        return overlay
    }()
    
    
    init(){
        super.init(frame: nativeFrame)
        self.frame = nativeFrame
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        overlay.frame = nativeFrame
        addSubview(overlay)
    }
    
    override func addSubview(_ view: UIView) {
        fatalError("Cannot add subview to this, Use defined method")
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
