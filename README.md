# MaterialDialogs-iOS
A library of Material Design dialogs for iOS 
This library was inspired by [Material-dialogs for Android](https://github.com/afollestad/material-dialogs)

![Material Dialog Image](https://github.com/codesworth/MaterialDialogs-iOS/blob/master/Material-Dialogs-iOS/Screenshots/materialDialogSnapshot.jpg)

#Requirements
* Xcode 8+
* iOS 9.0+

#Installation
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
