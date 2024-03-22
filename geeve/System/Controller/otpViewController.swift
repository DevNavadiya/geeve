//
//  otpViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 13/03/24.
//

import UIKit
import AEOTPTextField

class otpViewController: UIViewController {
   

    @IBOutlet weak var otp: AEOTPTextField!
     var getotp = ""
    
    var name = String()
    var lastname = String()
    var email = String()
    var phonenumber = String()
    var password = String()
    var uid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.otp.otpDelegate = self
        otp.configure(with: 4)
        otp.otpFilledBorderColor = .orange
        otp.otpTextColor = .orange
        
//        otp.textColor = .orange
     
    }
    
    @IBAction func continu_btn(_ sender: Any) {
       

          saveUserData(name: name, lastname: lastname, Email: email, phonenumber: phonenumber, Password: password, id: uid)
        
        
        print(lastname)
        if let otp = otp.text , !otp.isEmpty {
            
            if otp == getotp{
                
                navigateToViewController(main: "Main", storyboard: "registrationViewController", navigationController: self.navigationController)
            }
        }
    
    }
    
    @IBAction func back_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension otpViewController:AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print(code)
        
        
        self.getotp = code
    }
}
