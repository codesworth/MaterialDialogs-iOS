//
//  Dialogs.swift
//  ExampleApp
//
//  Created by Shadrach Mensah on 25/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import MaterialDialog

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
    
    private var infiniteFooterlessProgress:MaterialDialog = {
        let prog = MaterialDialog.progressDialog(title: "Downloading", info: "Please wait....", addCancel: false, completion: { (type) in
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
       dialogs = [basicdialog,textInputDialog,inputGroup,proressiveDialog,infiniteProgress,infiniteFooterlessProgress,singleList,multiList,createView()]
        names = ["Basic Dialog", "Text Input Dialog", "Text Input Group Dialog","Progressive Dialog", "Infinite Progress Dialog","Infinite Progress Dialog (No Footer)", "Single List Dialog", "Multiple List Dialog", "Custom View"]
    }
    
    var colorInfo:(color:UIColor,position:Int)?
    
    @objc func colorThis(_ button:ColorButtons){
        colorInfo = (button.color,button.position)
    }
    
    func createView()->MaterialDialog{
        let cview = UIView(frame: CGRect(origin: .zero, size: CGSize(width:UIScreen.main.bounds.width * 0.9
            , height:200)))
        let colorStck = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width * 0.9, height: 100)))
        colorStck.distribution = .fillEqually
        colorStck.alignment = .center
        colorStck.axis = .horizontal
        for i in 1...4{
            let color = UIColor.getRandom()
            let spot = ColorButtons(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)), color: color, position: i)
            spot.addTarget(self, action: #selector(colorThis(_:)), for: .touchUpInside)
            colorStck.addSubview(spot)
        }
        NSLayoutConstraint.activate([
            colorStck.leadingAnchor.constraint(equalTo: cview.leadingAnchor, constant: 16),
            colorStck.trailingAnchor.constraint(equalTo: cview.trailingAnchor, constant: -16),
            colorStck.heightAnchor.constraint(equalToConstant: 50),
            colorStck.topAnchor.constraint(equalTo: cview.topAnchor, constant: 20)
        ])
        
        let custom = CustomDialog(view: cview) { () -> Any in
            return self.colorInfo ?? (.black,-1)
        }
        
        let dialog = MaterialDialog.customDialog(title: "Pick A Color", customview: custom, withFooter: true) { (type) in
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
        return dialog
    }
    
    
}


class ColorButtons:UIButton{
    
    var color:UIColor = .black
    
    var position:Int = -1
    
    
    init(frame: CGRect, color:UIColor,position:Int) {
        super.init(frame: frame)
        self.color = color
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
        backgroundColor = color
    }
    
    
}


extension UIColor{
    
    class func getRandom()->UIColor{
        let colors:[UIColor] = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.3565862775, green: 0.8337638974, blue: 0.8115196824, alpha: 1)]
        return colors.randomElement()!
    }
}
