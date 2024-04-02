//
//  singInViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 13/03/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
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
            
        } else {
            
            
            Auth.auth().signIn(withEmail: self.email.text!, password: self.pass.text!) { data,erro in
                if let error = erro as? NSError {
                    print(error.localizedDescription)
                    
                    if let errorCode = AuthErrorCode(rawValue: error.code) {
                        switch errorCode {
                        case .userNotFound:
                            self.showAlert(title: "Email Not Found", message: "The email you entered is not registered. Please sign up with a valid email.")
                        case .wrongPassword:
                            self.showAlert(title: "Password Incorrect", message: "The password you entered is incorrect. Please enter the correct password.")
                        default:
                            self.showAlert(title: "Error", message: "An error occurred while signing in. Please try again later.")
                        }
                    }
                }else{
                    print("User signed in")
                
                        defultdata.sher.setlogindata(notindata: self.email.text ?? "")
                        defultdata.sher.setloginpass(notindata: self.email.text ?? "")
                        
                        print("userlogin")
                        
                        let userinfo = Auth.auth().currentUser
                        login(Email: self.email.text ?? "", Password: self.pass.text ?? "" )
                        
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registrationViewController") as! registrationViewController
                        vc.notindata = defultdata.sher.getlogindata() ?? ""
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    
                }
              
            }
            
           
        }
            
        
    }
    
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
//    MARK: - forgatpassbtn conditon -
    
    @IBAction func forgat_Pass_Btn(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "forgetPasswordViewController", navigationController: self.navigationController)
        
    }
    
// MARK: -  singinbtn conditon -
    
    @IBAction func sing_In_Btn(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "sing_Page_ViewController", navigationController: self.navigationController)
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "donationPagesViewController") as! donationPagesViewController
        
        vc.userin.set(true, forKey: "USERIN")
        
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

extension singInViewController {
    
    func checkEmailExistence(_ email: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("Userinfo").whereField("Email", isEqualTo: email).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error checking email existence: \(error.localizedDescription)")
                completion(false)
            } else {
                if let snapshot = snapshot, !snapshot.documents.isEmpty {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func checkPassword(_ email: String, _ password: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("Userinfo").whereField("Email", isEqualTo: email).whereField("Password", isEqualTo: password).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error checking password: \(error.localizedDescription)")
                completion(false)
            } else {
                if let snapshot = snapshot, !snapshot.documents.isEmpty {
                    completion(true)
                } else {
                    completion(false) 
                }
            }
        }
    }
}
