//
//  DBManager.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import Firebase
import JSQMessagesViewController

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
            "date":Date().timeIntervalSince1970   // date of now as double cause DB cant save Date
        ]
        
        roomsRef.childByAutoId().setValue(dict)
    }
    
    func updateRoom(_ room : Room, name : String){
        roomsRef.child(room.id).updateChildValues(["name" : name])
    }
    
    func deleteRoom(_ room : Room){
        roomsRef.child(room.id).removeValue()   // or roomsRef.child(room.id).setValue(nil)
    }
    
    // 2 methods which tell a story about room changes - someone listener to them inorder to delete at the array and table
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
    
    func observeRoomUpdated(_ completion : @escaping (String, String) -> Void){
        roomsRef.observe(.childChanged) { (snapshot : DataSnapshot) in
            guard let value = snapshot.value as? [String:Any] else{
                return
            }
            completion(snapshot.key, value["name"] as! String)
        }
    }
    
    // 16.8.17 creating messages
    // MARK: - Messages
    func createMessage(with text : String, room : Room){
        guard let uid = Auth.auth().currentUser?.uid else {   // only user could create message
            return
        }
        
        let dict : [String:Any] = [
            "sender":uid,
            "date":Date().timeIntervalSince1970,
            "text":text,
            "name":Auth.auth().currentUser?.displayName ?? ""
        ]
        
        messagesRef.child(room.id).childByAutoId().setValue(dict)
    }
    
    // will work in incoming or outcoming message
    func observeNewMessage(by room : Room, completion : @escaping (JSQMessage)->Void){
        
        messagesRef.child(room.id).observe(.childAdded, with: { (snapshot) in
            guard let dict = snapshot.value as? [String:Any] else{
                return
            }
            
            let senderId = dict["sender"] as? String ?? ""
            let name = dict["name"] as? String ?? ""
            let timestamp = dict["date"] as? TimeInterval ?? 0
            let date = Date(timeIntervalSince1970: timestamp)
            let text = dict["text"] as? String ?? ""
            
            guard let msg = JSQMessage(senderId: senderId, senderDisplayName: name, date: date, text: text) else{
                return
            }
            completion(msg)
        })
    }
    
}


