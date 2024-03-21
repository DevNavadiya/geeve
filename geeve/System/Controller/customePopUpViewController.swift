//
//  customePopUpViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 14/03/24.
//

import UIKit

class customePopUpViewController: UIViewController {

    var clouser : (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singupbtn(_ sender: Any) {
        
        self.clouser?()
        self.dismiss(animated: true)
        
    }
    
   
}
