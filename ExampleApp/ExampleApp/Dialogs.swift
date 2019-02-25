//
//  Dialogs.swift
//  ExampleApp
//
//  Created by Shadrach Mensah on 25/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import Material_Dialogs_iOS

class Dialogs{
    
    private var basicdialog:MaterialDialog = {
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
    
    private var textInputDialog:MaterialDialog = {
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
    
    private var inputGroup:MaterialDialog = {
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
    
    
    private var proressiveDialog:ProgressDialog = {
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
    
    private var infiniteProgress:MaterialDialog = {
        let prog = MaterialDialog.progressDialog(title: "Downloading", info: "Please wait....", addCancel: true, completion: { (type) in
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
    
    private var singleList:MaterialDialog = {
        let list = ["Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest"]
        let dialog = MaterialDialog.listDialog(title: "Best Social Network", list: .singleChoice, accessoryType: .radio, choices: list, cancelActionTitle: "CANCEL", actionTitle: "CONFIRM", completion: { (type) in
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
    
    private var multiList:MaterialDialog = {
        let list = ["Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest","Facebook", "Twitter", "Instagram", "Pinterest"]
        let dialog = MaterialDialog.listDialog(title: "Best Social Network", list: .multipleChoice, accessoryType: .checkbox, choices: list, cancelActionTitle: "CANCEL", actionTitle: "CONFIRM", completion: { (type) in
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
    
    var dialogs:[MaterialDialog] = []
    var names:[String] = []
    
    
    
    init() {
       dialogs = [basicdialog,textInputDialog,inputGroup,proressiveDialog,infiniteProgress,singleList,multiList]
        names = ["Basic Dialog", "Text Input Dialog", "Text Input Group Dialog","Progressive Dialog", "Infinite Progress Dialog", "Single List Dialog", "Multiple List Dialog"]
    }
    
    
}
