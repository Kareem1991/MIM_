import UIKit
import SwiftMessages
import SVProgressHUD
import Kingfisher


extension UIViewController  {
    
    //MARK: - Loading
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    // MARK: - Transparent With Nav Bar
    func transparentNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    // MARK: - Initiate ViewController
    func controller<T>(_ indetifier: T.Type, storyboard: Storyboards = Storyboards.Authentication) -> T {
        
        let storyboard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vcr: UIViewController = storyboard.instantiateViewController(withIdentifier: String(describing: indetifier))
        if let controller = vcr as? T {
            return controller
        } else {
            fatalError("Controller failed while casting")
        }
    }
    // MARK: - Nav Bar Title Image
    func setTitleImg(_ img: UIImage = #imageLiteral(resourceName: "Logo")) {
        let imageView: UIImageView = UIImageView(image: img)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    //MARK:- Back To RootViewController
    @IBAction func backToRootClicked(_ sender: Any) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    //MARK:- Dismiss ViewController
    @IBAction func dismissClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- pop ViewController
    @IBAction func popNavClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK:- Dismiss to RootViewController
    @IBAction func dismisstoRootClicked(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    // MARK: - Pop back n viewcontroller
    func popBack(_ numOfVCs: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < numOfVCs else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - numOfVCs], animated: true)
                return
            }
        }
    }
    
    // MARK: - Pop back to specific viewcontroller
    func popBack<T: UIViewController>(toControllerType: T .Type) {
        if var viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            viewControllers = viewControllers.reversed()
            for currentViewController in viewControllers {
                if currentViewController .isKind(of: toControllerType) {
                    self.navigationController?.popToViewController(currentViewController, animated: true)
                    break
                }
            }
        }
    }
    
    // MARK: - Show Alert
    func showAlertWith(title: String? = nil, msg: String? = nil, type: Theme = .error , layout: MessageView.Layout = .cardView) {
        let view = MessageView.viewFromNib(layout: .messageView)
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureTheme(backgroundColor: .blue , foregroundColor: .white)
        view.configureContent(title: title ?? "", body: msg ?? "", iconText: "")
        view.button?.isHidden = true
        SwiftMessages.show(config: config, view: view)
    }
    // MARK: - Show Alert with Action
    func showAlertWithAction(alertTitle: String, alertMsg: String, buttonTitle: String, action: ((UIAlertAction) -> Swift.Void)? = nil, cancelBtnTitle: String? = nil) {
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        var cancelAction = UIAlertAction()
        if cancelBtnTitle == nil {
            cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        }else {
            cancelAction = UIAlertAction(title: cancelBtnTitle, style: .cancel, handler: nil)
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Check For Empty Strings
    func isNotEmptyString(text: String, withAlertMessage message: String) -> Bool{
        if text == ""{
            showAlertWith(msg: message)
            return false
        }
        else{
            return true
        }
    }
    func valideTextLength(text:String , withAlertMessage message: String , type: Bool? = false) -> Bool {
        if type == true {
            if  text.count < 8 {
                showAlertWith(msg: message)
                return false
            } else {
                return true
            }
        } else {
            if text.count < 2 {
                showAlertWith(msg: message)
                return false
            }
            if  text.count > 10  {
                showAlertWith(msg: message)
                return false
            }
             else {
                return true
            }
        }
        
    }
    
    
//    func isPasswordHasEightCharacter(password: String) -> Bool {
//        let passWordRegEx = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
//    }
       func isValidPassword(password: String) -> Bool {
//        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@" , passwordRegex)
//        return passwordTest.evaluate(with: password)
        
        
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", argumentArray: [passwordRegex])
        if !passwordTest.evaluate(with: password){
            showAlertWith(msg: "Password not less than 8 character include 1 number , 1 special character , 1 letter".localized)
            
        }
        return passwordTest.evaluate(with: password)

    }

    

    // MARK: - Check Confirmation
    func isTextsIdentical(text1: String, text2: String, withAlertMessage message: String) -> Bool{
        if text1 == text2 {
            return true
        }else {
            showAlertWith(msg: message)
            return false
        }
    }
    
    // MARK: - Email And Phone Validation
    func isEmailValid(emailString: String) -> Bool{
        let regExPattern = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regExPattern])
        if !emailTest.evaluate(with: emailString){
            showAlertWith(msg: "Please enter a valid email address".localized)
            
        }
        return emailTest.evaluate(with: emailString)
    }
    
    func isPhoneNumberValid(phoneNumber: String) -> Bool{
        var isValid = true
        let nameValidation = phoneNumber.replacingOccurrences(of: " ", with: "")
        
        if (nameValidation.count < 9 || nameValidation.count > 14) { //check length limitation
            isValid = false
        }
        
        if !isValid{
            showAlertWith(msg: "Please, Insert Phone Number Correctly".localized)
        }
        return isValid
    }
    
    //MARK:- Check For SaudiNumber
    func validatePhoneNumber(phone:String) -> Bool {
        if phone.starts(with: "0".localized) {
            if phone.count == 10 {
                return true
            } else {
                 showAlertWith(msg: "Please make sure that your phone number not less or greater than 13 numbers".localized)
                return false
            }
        } else {
            if phone.count == 9 {
                return true
            } else {
                showAlertWith(msg: "Please make sure that your phone number not less or greater than 12 numbers".localized)
               return false
            }
        }
    }
    

}
