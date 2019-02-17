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
        
        let imgview = UIImageView(frame: view.frame)
        imgview.image = UIImage(named: "Vampire Toucan.jpg")
        imgview.contentMode = .scaleAspectFill
        view.addSubview(imgview)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            
            let body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
            
            let dialog = MaterialDialog.basicDialogue("This is first Test Run", body: body, cancelActionTitle: "Dismiss", actionTitle: "Save")
            dialog.show()
            
        }
    }
    


}

