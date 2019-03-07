# MaterialDialogs-iOS
A library of Material Design dialogs for iOS 
This library was inspired by [Material-dialogs for Android](https://github.com/afollestad/material-dialogs)

![Material Dialog Image](https://github.com/codesworth/MaterialDialogs-iOS/blob/master/Material-Dialogs-iOS/Screenshots/materialDialogSnapshot.jpg)

# Requirements
* Xcode 8+
* iOS 9.0+

# Installation
* MaterialDialogs can be to an Xcode Project manually by adding the Sources folder to the project or
* Via [Cocoapods](https://cocoapods.org/)
```ruby
pod 'MaterialDialog'
```
# Usage
MaterialDialogs provides several types of dialogs for interacting with user. All dialogues are created in similar manner.
Dont forget to call `show()` on a dialog inorder for it to appear in view. Do not add dialogs as a subview.
## Structure of A Dilaog
All MaterialDialog initializers take in fairly straight forward arguments such as headerTitle, body, and actiontitles depending on the type of Dialog chosen, but most important initializer parameter is the `completion:` arg. The completion paramter is a closure that provides a mechanism for triggering further actions after a dialog button is interacted with. The closure also provides a parameter known as the `actionType:ActionType`. ActionType is an enum with two cases for when a user presses either the cancel Action button or an affirmative button on the dialog. 
```swift
public enum ActionType{
        case affirm(Any)
        case cancel
    }
```
The affirm case also passes in an object of the containing necessary response data of the affirmative button pressed. Each dialog type has its unique object passed in to the affirm case. 

| Material Dialog      |     affirm(Returnobject)     |
| -------------------  |:----------------------------:|
| Basic Dialog         | affirm(Bool)                 |
| Text Input Dialog    | affirm(String)               |   
| Text Input Group     | affirm([String]              | 
| Progressive Dialog   | affirm(Bool)                 |
| Progress Dialog      | affirm(Bool)                 |
| Single Choice Dialog | affirm(Int)                  |
| Multi Choice Dialog  | affirm(IndexSet)             |
| Custom View Dialog   | affirm('User Defined Type')  |
  

  
Check Xcode documentation for further clarification

## Basic Dialog
```swift
let dialog = MaterialDialog.basicDialogue("This is Test Run", body: text, cancelActionTitle: "Dismiss", actionTitle: "Confirm", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm(let sucess):
                print("I was affirmed with")
                break
            }
        })
 dialog.show()       
```
Dispays a simple dilog with text. Optional affirm Action button.


## Text Input Dialog
```swift
let newDialog = MaterialDialog.textInputDialog(title: "Enter Your Name", placeholder: "Your Name", cancelActionTitle: "Dismiss", actionTitle: "Save", completion: { (type) in
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
 newDialog.show()
```
Useful For retriving quick info from user

## Text Input Group Dialog
```swift
let group = MaterialDialog.textInputGroupDialog(title: "Enter Credentials", numberOfInputs: 3, placeholders: ["Enter Name","Enter Email", "Enter Password"], cancelActionTitle: "Dismiss", actionTitle: "Sign In", completion: { (type) in
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
 group.show()
```
Retrieving multiple information from a user

## Progressive Dialog
```swift
let dialog = MaterialDialog.progressiveDialog(title: "Downloading Video", completion: { (type) in
            switch type{
            case .cancel:
                print("I was Cancelled")
                break
            case .affirm:
                print("I was affirmed")
                break
            }
        })
dialog.show()
```
For progressive dialog the user must call the `updateWith(progress value:CGFloat)` method repeatedly with new values for the progress. `dialog.updateWith(progress:0.5)`. Failure to call this method will show a progressive dialog with no detectible progress. Progress value is a floating point number between 0 and 1

## Progress Dialog (Infinite)
```swift
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
    
prog.show()
```
Shows a progress dialog with a continuous spinning wheel. Option for a Footerless progress dialog by setting addCancel param to `false`. Setting addCancel to `true` will add a footer with Cancel action Button. If addCancel is set to `false`, then you will be responsible for dismissing the dialog from screen. Do this by calling cancel() i.e `prog.cancel()`


## Single Choice List Dialog
```swift
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
dialog.show()
```
A List Dialog that allows only single selection. Parameter `accessoryType:` gives the option to choose between Radio buttons and checkmarks as the designated icons for selction.


## Multiple Choice List Dialog
```swift
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
dialog.show()
```
A List Dialog that allows multiple selection. Parameter `accessoryType:` gives the option to choose between Radio buttons and checkmarks as the designated icons for selction.

## Custom View Dialogs
Custom View dialogs are special Material dialogs that allows you to explicitly set the contents view of the dialog. It however comes with some constraints. This is an example of a how to create a custom view Dialog
```swift
let custom = CustomDialog(view: myCutomUIView) { () -> Any in
            return someOperationInThisCustomView()
 }
 
 let dialog = MaterialDialog.customDialog(title: "Pick A Color", customview: custom, withFooter: true) { (type) in
            switch type{
            case .affirm(let result):
                guard let result = result  else {
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
        
```
The custom view must be wrapped in a CustomDialog class which takes a UIView and a closure that returns a value when the affirm action button is triggered. You are responsible for implementing the return value in the closure. Refer to Sample Example For more Info.


## Customizations
MaterialDialogs abstracts away all the chores of having to build UI for the dialogs. However you can change the tint color for the dialog by calling the `setGlobalTint(color:UIColor)` method on a dialog before calling the `show` method.
```swift
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
dialog.setGlobalTint(UIColor.magenta)
dialog.show()   
```

## Contribution
MaterialDialog is open to contibutions. Submit all Pull requests on the branch develop. Feel free to add more dialogs and functionality. The theme of the dialogs should however still maintain the material look and users should not be required to do much configuration in order to get a dialog setup. 
