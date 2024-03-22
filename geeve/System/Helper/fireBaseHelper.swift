//
//  fireBaseHelper.swift
//  geeve
//
//  Created by Dev Navadiya on 22/03/24.
//

import Foundation
import FirebaseFirestore
import UIKit



func login (Email : String , Password : String) {
    
    let databaase = Firestore.firestore()
    let collection = databaase.collection("loginUser")
    
    collection.document(Email).setData(["Email" : Email , "Password" : Password])
    
}


func saveUserData (name : String , lastname : String , Email : String , phonenumber : String , Password : String , id : String) {
    
    let database = Firestore.firestore()
    let collection = database.collection("Userinfo")
    collection.document(Email).setData(["name" : name ,
                                       "lastname" : lastname ,
                                       "Email" : Email ,
                                       "phonenumber" : phonenumber ,
                                       "Password" : Password ,
                                       "UId" : id ])
    
    
}
