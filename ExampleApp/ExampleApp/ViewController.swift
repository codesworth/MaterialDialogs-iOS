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
    
    var dialog:MaterialDialog!

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
    }
    
//    func updateTill(){
//
//        start = start + 0.05
//        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
//            self.proressiveDialog.updateWith(progressValue: self.start)
//            self.updateTill()
//            if self.start > 1 {return}
//        }
//    }
    
    
    func createView(){
        let cview = UIView(frame: CGRect(origin: .zero, size: CGSize(width:view.frame.width * 0.9
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
            imageView.trailingAnchor.constraint(equalTo: cview.trailingAnchor, constant: -20),
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

