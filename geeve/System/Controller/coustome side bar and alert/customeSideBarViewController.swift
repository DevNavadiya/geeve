//
//  customeSideBarViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 14/03/24.
//

import UIKit

class customeSideBarViewController: UIViewController {
    
    var singouut : (() -> Void)?
    
    
    @IBOutlet weak var sideview: UIView!
    
    @IBOutlet weak var backbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func button(_ sender: Any) {
        
        
        self.dismiss(animated: true)
        
        
    }
    
    
    @IBAction func logout(_ sender: Any) {
        self.singouut?()
       
        
    }
    
    
}
