//
//  DBManager.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import Firebase

class DBManager{
    static let manager = DBManager()
    
    let rootRef : DatabaseReference    // the begin of tree
    let roomsRef : DatabaseReference    // the rooms
    let messagesRef : DatabaseReference    // the messages
    
    init() {
        rootRef = Database.database().reference()
        roomsRef = Database.database().reference().child("rooms")
        messagesRef = Database.database().reference().child("messages")
    }
    
    func createRoom(with name : String){
        guard let uid = Auth.auth().currentUser?.uid else {   // only user could create room
            return
        }
        
        // the room parameters
        let dict : [String:Any] = [
            "name":name,
            "owner":uid,
            "date":Date().timeIntervalSince1970
        ]
        
        roomsRef.childByAutoId().setValue(dict)
    }
    
    func deleteRoom(_ room : Room){
        roomsRef.child(room.id).removeValue()   // or roomsRef.child(room.id).setValue(nil)
    }
    
    func observeRoomAdded(_ completion : @escaping (Room) -> Void){
        roomsRef.observe(.childAdded) { (snapshot : DataSnapshot) in
            guard let value = snapshot.value as? [String:Any] else{
                return
            }
            
            let r = Room(key: snapshot.key, value: value)
            completion(r)
        }
    }
    
    func observeRoomRemoved(_ completion : @escaping (String)->Void){
        roomsRef.observe(.childRemoved) { (snapshot : DataSnapshot) in
            completion(snapshot.key)
        }
    }
    
}


