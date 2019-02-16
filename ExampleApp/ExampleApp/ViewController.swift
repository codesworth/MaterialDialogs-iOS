//
//  ViewController.swift
//  ExampleApp
//
//  Created by Shadrach Mensah on 15/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import Material_Dialogs_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            
            let body = "Helklo man Doen said he could hardd. Let him wash it out. You coipod try to nbe amore adecnet herl biy just hamen to what toy beop on man is just weakj asjk "
            
            let dialog = MaterialDialog.basicDialogue("This is first Test Run", body: body, cancelActionTitle: "Dismiss", actionTitle: "Save")
            dialog.show()
            
        }
    }
    


}

