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
    
    
    
    var dialog:MaterialDialog = {
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        let dialog = MaterialDialog.basicDialogue("This is Test Run", body: text, cancelActionTitle: "Dismiss", actionTitle: "Confirm", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm:
                print("I was affirmed")
                break
            }
        })
        return dialog
    }()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.dialog.show()
            
            
//            let dialog = MaterialDialog.basicDialogue("This is Test Run", body: body, cancelActionTitle: "Dismiss", actionTitle: "Confirm", completion: { (type) in
//                switch type{
//                case .cancel:
//                    print("I was Cancelled")
//                    break
//                case .affirm:
//                    print("I was affirmed")
//                    break
//                }
//            })
            //MaterialDialog.basicDialogue("This is for Test Run", body: body, cancelActionTitle: "Dismiss", actionTitle: "Save", completion: nil).show()
            
            
        }
    }
    


}

