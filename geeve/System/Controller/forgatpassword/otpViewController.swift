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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.otp.otpDelegate = self
        otp.configure(with: 4)
        otp.otpFilledBorderColor = .orange
        otp.otpTextColor = .orange
        
//        otp.textColor = .orange
     
    }
    
    @IBAction func continu_btn(_ sender: Any) {
       
      
        if let otp = otp.text , !otp.isEmpty {
            
            if otp == getotp{
                
                navigateToViewController(main: "Main", storyboard: "resetPassViewController", navigationController: self.navigationController)
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
