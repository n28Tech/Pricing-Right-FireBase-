//
//  ClientLoading.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/20/20.
//

import Foundation
import Firebase

func getChartIndexValues(completion:@escaping ([NSDictionary]) -> ()) {
    let userID = Auth.auth().currentUser?.uid
    
            db.collection("projects")
                .whereField("uid", isEqualTo:userID!)
                .addSnapshotListener { querySnapshot, error in
                    guard let snapshot = querySnapshot else {
                        print("Error retreiving snapshots \(error!)")
                        return
                    }
                    
                    let clients = (snapshot.documents.map { $0.data() })as [NSDictionary]
                    completion(clients)
                
                }

    
}









