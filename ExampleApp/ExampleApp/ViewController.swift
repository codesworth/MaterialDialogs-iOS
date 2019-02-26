//
//  ViewController.swift
//  ExampleApp
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import MaterialDialog

class ViewController: UIViewController {
    
    var dialog:MaterialDialog!
    var autoDismiss = false
    var start:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imgview = UIImageView(frame: view.frame)
        imgview.image = UIImage(named: "Vampire Toucan.jpg")
        imgview.contentMode = .scaleAspectFill
        view.addSubview(imgview)
       
    }
    
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.dialog.show()
        }
        updateTill()
        if autoDismiss{
            dialog.cancel()
        }
    }
    
    func updateTill(){
        if let dialog = dialog as? ProgressDialog{
            start = start + 0.05
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
                dialog.updateWith(progressValue: self.start)
                self.updateTill()
                if self.start > 1 {return}
            }
        }
        
    }
    
    
    

}

