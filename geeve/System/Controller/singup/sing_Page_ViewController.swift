//
//  sing_Page_ViewController.swift
//  geeve App
//
//  Created by Dev Navadiiya on 29/02/24.
//

import UIKit
import FirebaseAuth



class sing_Page_ViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var firest_Name_Texfild: UITextField!
    
    @IBOutlet weak var last_Name_TextFileld: UITextField!
    
    @IBOutlet weak var Email_Textfiled: UITextField!
    
    @IBOutlet weak var phone_number_textFild: UITextField!
    
    @IBOutlet weak var paswoord_Text_filed: UITextField!
    
    @IBOutlet weak var enter_conform_password_textfild: UITextField!
    
    @IBOutlet weak var tic_mark_Terms: UIButton!
    
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.phone_number_textFild.keyboardType = .numberPad
      
    }
    
    // MARK: - terms butoon condition -
    
    
    @IBAction func tic(_ sender: Any) {
        
        
        if  !tic_mark_Terms.isSelected == true {
            
            let image = UIImage(named: "cutome")
            
            self.tic_mark_Terms.setImage(image, for: .normal)
            print("tap")
            
        }else{
            
            let image = UIImage(named: "Image 4")
            
            self.tic_mark_Terms.setImage(image, for: .normal)
            print("not tap")
        }
        tic_mark_Terms.isSelected.toggle()
        
        
        
        
    }
    
    // MARK: - Sing UP condition -
    
    
    @IBAction func sing_Up_Btn(_ sender: Any) {
        
        if firest_Name_Texfild.text!.isEmpty || self.last_Name_TextFileld.text!.isEmpty || self.phone_number_textFild.text!.isEmpty || self.paswoord_Text_filed.text!.isEmpty || self.Email_Textfiled.text!.isEmpty || self.enter_conform_password_textfild.text!.isEmpty {
            
            let alert =  UIAlertController(title: "Sign Up", message:   "plese enter All Details  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            print("butoontap")
            
        }
        
        if self.paswoord_Text_filed.text! != self.enter_conform_password_textfild.text {
            let allert = UIAlertController(title: "Password Doesn't Match", message: "Plese chake your conform Password It Was Not Similar", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "OK", style: .destructive)
            allert.addAction(btn1)
            self.present(allert, animated: true)
            self.enter_conform_password_textfild.text = ""
        }
        
        if tic_mark_Terms.isSelected == false {
            let alert =  UIAlertController(title: "Terms And Conditions", message:   "plese agree our Terms And Conditions", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            print("butoontap")
            
        }
        
        else {
           
            Auth.auth().createUser(withEmail: self.Email_Textfiled.text ?? "nil" , password: self.paswoord_Text_filed.text ?? "nil"){otheruser,error in
                if let error = error as? NSError {
                    print(error.localizedDescription)
                }else{
                    print("user rejister")
                    let userInfo = Auth.auth().currentUser
                    self.id = userInfo!.uid
                }
                
            }
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "otpViewController") as! otpViewController
           
           
            
            vc.name = self.firest_Name_Texfild.text ?? "no name"
            vc.lastname = self.last_Name_TextFileld.text ?? "no last name"
            vc.email = self.Email_Textfiled.text ?? "no email"
            vc.phonenumber = self.phone_number_textFild.text ?? "no password"
            vc.password = self.paswoord_Text_filed.text ?? "no pass"
            vc.uid = self.id
            
            self.navigationController?.pushViewController(vc, animated: true )
        }
    }
   
    // MARK: - Singin -
    
    @IBAction func singin(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "singInViewController", navigationController: self.navigationController)
        
    }
    
    @IBAction func privicy(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "webViewController", navigationController: self.navigationController)
        
        
        
        
    }
    
    
    
}
