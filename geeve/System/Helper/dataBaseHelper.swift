////
////  dataBaseHelper.swift
////  geeve
////
////  Created by Dev Navadiya on 17/03/24.
////
//
//import Foundation
//import CoreData
//import UIKit
//
//
//class coredataHeleper {
//    
//    static let shard = coredataHeleper()
//    
//    lazy var presistentcontroler : NSPersistentContainer = {
//        
//        var contaner = NSPersistentContainer(name: "geeve")
//        
//        contaner.loadPersistentStores(completionHandler: {(store , error ) in
//            if let error = error as? NSError{
//                print("error is \(error)")
//            }})
//        
//        return contaner
//        
//    }()
//    
//    
//    
//    func savedata (name : String , age : String) {
//        
//        var context = presistentcontroler.viewContext
//        
//        var entityty = NSEntityDescription.insertNewObject(forEntityName: "UserSingUp", into: context) as! UserSingUp
//
//        do {
//            try context.save()
//        }catch{
//            print(error)
//        }
//        
//    }
//    
////    func getdata () -> [UserSingIn] {
////        
////        var context = presistentcontroler.viewContext
////        
////        var request = [UserSingIn]()
////        
////        do{
////         
////            request = try context.fetch(UserSingIn.fetchRequest())
////            
////        }catch let erro {
////            print (erro)
////        }
////        
////        return request
////    }
////    
//    
//}
