//
//  ClientLoading.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/20/20.
//

import Foundation
import Firebase

func getChartIndexValues(completion:@escaping (NSDictionary) -> ()) {
    let userID = Auth.auth().currentUser?.uid
    
    ref.child("Users").child(userID!).observe(.value, with: { (snapshot) in

        let clients = snapshot.value as! NSDictionary
        completion(clients)
        })

}






//class func loadClient(completionHandler: (genre: NSDictionary) -> ()) {
//        let userID = Auth.auth().currentUser?.uid
//  var clients = NSDictionary()
//
//
//        ref.child("Users").child(userID!).observe(.value, with: { (snapshot) in
//          clients = snapshot.value as! NSDictionary
//            completionHandler(clients)
//          })
//
//
//
//    }


