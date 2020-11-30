//
//  Queries.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/28/20.
//

import Foundation
import Firebase


    

    func getbyLocationData(location:String, completion:@escaping ([NSDictionary]) -> ()) {
       
        
                db.collection("projects")
                    .whereField("clientState", isEqualTo:location)
                    .addSnapshotListener { querySnapshot, error in
                        guard let snapshot = querySnapshot else {
                            print("Error retreiving snapshots \(error!)")
                            return
                        }
                        
                        let clients = (snapshot.documents.map { $0.data() })as [NSDictionary]
                        completion(clients)
                    
                    }



 }

