//
//  singInViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 13/03/24.
//

import UIKit
import FirebaseAuth
class singInViewController: UIViewController {
  
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var remember_me: UIButton!
    
    @IBOutlet weak var eye: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
// MARK: - remeber mi butoon condition -
   
    @IBAction func remember_Mi_Btn(_ sender: Any) {
        
    
        if  !remember_me.isSelected == true {
            
            let image = UIImage(named: "cutome")
            
            self.remember_me.setImage(image, for: .normal)
            print("tap")
            
        }else{
            
            let image = UIImage(named: "Image 4")
            
            self.remember_me.setImage(image, for: .normal)
            print("not tap")
        }
        remember_me.isSelected.toggle()
        
        
        
// MARK: - singupbtn conditon -
        
    }
    
    @IBAction func sing_Up_Btn(_ sender: Any) {
        
        if email.text!.isEmpty || pass.text!.isEmpty {
            
            
            let alert = UIAlertController(title: "Sing In", message: "plese enter Valid email id or password", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "OK", style: .default)
            alert.addAction(btn1)
            
            self.present(alert, animated: true)
            
        }else {
            

            Auth.auth().signIn(withEmail: self.email.text!, password: self.pass.text!) {data,erro in
                if let error = erro as? NSError {
                    print(error.localizedDescription)
                
                    
                    let alert = UIAlertController(title: "New User Found", message: "Plese chke your email id , your emai was allredy rejister on geeve", preferredStyle: .alert)
                    let btn = UIAlertAction(title: "OK", style: .destructive)
                    
                    alert.addAction(btn)
                    
                    self.present(alert, animated: true)
                    
                    
                }else{
                 
                    print("userlogin")
                     
                     let userinfo = Auth.auth().currentUser
                     login(Email: self.email.text!, Password: self.pass.text! )
                     login(Email: self.email.text ?? "no email", Password: self.pass.text ?? "no pass" )
                    
                     let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registrationViewController") as! registrationViewController
                    vc.notindata = self.email.text!
                     self.navigationController?.pushViewController(vc, animated: true)
                    
                }
              
            }
            
           
        }
            
        
    }
    
//    MARK: - forgatpassbtn conditon -
    
    @IBAction func forgat_Pass_Btn(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "forgetPasswordViewController", navigationController: self.navigationController)
        
    }
    
// MARK: -  singinbtn conditon -
    
    @IBAction func sing_In_Btn(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "sing_Page_ViewController", navigationController: self.navigationController)
    }
    
    @IBAction func eye(_ sender: Any) {
        
        if !eye.isSelected == true {
            self.pass.isSecureTextEntry = true
        }
        else {
            self.pass.isSecureTextEntry = false
        }
        
        eye.isSelected.toggle()
        
    }
}
