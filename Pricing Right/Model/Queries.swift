//
//  Queries.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/28/20.
//

import Foundation
import Firebase

struct Queries {
    func byState(){
        print("function called")
        let databaseRef = Database.database().reference(withPath: "Users")

        databaseRef.observeSingleEvent(of: .value, with: { (snapshot) in

                if snapshot.exists() {
                    print("it worked")
                } else {
                    // UID not found
                }
        })
 }
}

