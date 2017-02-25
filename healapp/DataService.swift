//
//  DataService.swift
//  testing
//
//  Created by Aqueel Miqdad on 7/11/16.
//  Copyright © 2016 Aditya Parakh. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    fileprivate var _REF_BASE = URL_BASE
    fileprivate var _REF_USERS = URL_BASE.child("users")
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    func createUser(_ uid: String, user: String){
        _REF_USERS.child(uid).setValue(user)
    }
    

    
    
}
