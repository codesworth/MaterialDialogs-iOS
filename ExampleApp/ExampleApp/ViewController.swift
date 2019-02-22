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
    var start:CGFloat = 0.0
    
    
    var dialog:MaterialDialog = {
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        let dialog = MaterialDialog.basicDialogue("This is Test Run", body: text, cancelActionTitle: "Dismiss", actionTitle: "Confirm", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm(let message):
                print("I was affirmed")
                break
            }
        })
        return dialog
    }()
    
    var newDialog:MaterialDialog = {
        let newDialog = MaterialDialog.textInputDialog(title: "Enter Your Name", placeholder: "Your Nmae", cancelActionTitle: "Dismiss", actionTitle: "Save", completion: { (type) in
            switch type{
            case .affirm(let result):
                guard let result = result as? String else {
                    print("Wrong Result")
                    return
                }
                print("This is Result: \(result)")
                break
            case .cancel:
                print("I was Cancelled")
                break
            }
        })
        
        return newDialog
    }()
    
    var inputGroup:MaterialDialog = {
        let group = MaterialDialog.textInputGroupDialog(title: "Enter Credentials", numberOfInputs: 3, placeholders: ["Enter Name","Enter Email", "Enter Password"], inputTextContentTypes: [.username,.emailAddress,.password], cancelActionTitle: "Dismiss", actionTitle: "Sign In", completion: { (type) in
            switch type{
            case .affirm(let result):
                guard let result = result as? [String] else {
                    print("Wrong Result")
                    return
                }
                print("This is Result: \(result)")
                break
            case .cancel:
                print("I was Cancelled")
                break
            }
        })
        return group
    }()
    
    
    var proressiveDialog:ProgressDialog = {
        let pat = MaterialDialog.progressiveDialog(title: "Downloading Video", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm:
                print("I was affirmed")
                break
            }
        })
        return pat
    }()
    
    var infiniteProgress:MaterialDialog = {
        let prog = MaterialDialog.progressDialog(title: "Downloading", info: "Please wait....", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm:
                print("I was affirmed")
                break
            }
        })
        return prog
    }()
    
    var singleList:MaterialDialog = {
        let list = ["Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest"]
        let dialog = MaterialDialog.listDialog(title: "Best Social Network", list: .singleChoice, choices: list, cancelActionTitle: "CANCEL", actionTitle: "CONFIRM", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm(let result):
                print("I was affirmed with data: \(result)")
                break
            }
        })
        return dialog
    }()
    
    var multiList:MaterialDialog = {
        let list = ["Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest"]
        let dialog = MaterialDialog.listDialog(title: "Best Social Network", list: .multipleChoice, choices: list, cancelActionTitle: "CANCEL", actionTitle: "CONFIRM", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm(let result):
                if let result  = result as? IndexSet{
                    let all = result.map{$0}
                   print("I was affirmed with data: \(all)")
                }
                
                break
            }
        })
        return dialog
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            //self.dialog.show()
            //self.newDialog.show()
            //self.inputGroup.show()
            //self.proressiveDialog.show()
            //self.updateTill()
            //self.infiniteProgress.show()
            //self.singleList.show()
            //self.multiList.show()
            self.createView()
            
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
    
    func updateTill(){
        
        start = start + 0.05
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.proressiveDialog.updateWith(progressValue: self.start)
            self.updateTill()
            if self.start > 1 {return}
        }
    }
    
    
    func createView(){
        let cview = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width
            , height:400)))
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Vampire Toucan.jpg")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        let lable = UILabel(frame: .zero)
        lable.text = "Boring Boring ha"
        lable.textColor = .blue
        cview.addSubview(imageView)
        cview.addSubview(lable)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        lable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cview.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cview.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: cview.trailingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            lable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            lable.centerXAnchor.constraint(equalTo: cview.centerXAnchor),
            lable.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
        let custom = CustomDialog(view: cview) { () -> Any in
            return lable.text ?? ""
        }
        
        let dialog = MaterialDialog.customDialog(title: "Custommyy", customview: custom, withFooter: true) { (type) in
            switch type{
            case .affirm(let result):
                guard let result = result as? String else {
                    print("Wrong Result")
                    return
                }
                print("This is Result: \(result)")
                break
            case .cancel:
                print("I was Cancelled")
                break
            }
        }
        dialog.show()
    }

}

