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
    fileprivate var _REF_CLIENTS = URL_BASE.child("clients")
    fileprivate var _REF_LIVE = URL_BASE.child("live")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_CLIENTS: FIRDatabaseReference {
        return _REF_CLIENTS
    }
    
    var REF_LIVE: FIRDatabaseReference {
        return _REF_LIVE
    }
    
    func createUser(_ uid: String, user: Dictionary<String, Any>){
        _REF_USERS.child(uid).setValue(user)
    }
    
    func createClient(_ uid: String, user: Dictionary<String, Any>){
        _REF_CLIENTS.child(uid).setValue(user)
    }
    
    func createLive(_ uid: String, user: Dictionary<String, Any>){
        _REF_LIVE.child(uid).setValue(user)
    }
    

    
    
}
