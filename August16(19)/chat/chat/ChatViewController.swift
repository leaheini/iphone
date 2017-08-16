//
//  ChatViewController.swift
//  chat
//
//  Created by hackeru on 16/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase

class ChatViewController: JSQMessagesViewController {
    
    var room : Room!  // ! cause for sure not nil, if ? we'll need init
    
    var messages : [JSQMessage] = []
    let outgoingBubble : JSQMessagesBubbleImage    // we need init
    //let incomingBubble : JSQMessagesBubbleImage // we need init
    var incomingBubbles : [String:JSQMessagesBubbleImage] = [:]
    
    required init?(coder aDecoder: NSCoder) {    // init of storyboard it coder
        
        let factory = JSQMessagesBubbleImageFactory()!
        outgoingBubble = factory.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        //incomingBubble = factory.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
        
        super.init(coder: aDecoder)
    }
    
    //stop listen to the observer - go out from chat
    deinit {
        DBManager.manager.messagesRef.child(room.id).removeAllObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 2 things must by JSQMessagesViewController
        self.senderId = Auth.auth().currentUser?.uid
        self.senderDisplayName = Auth.auth().currentUser?.displayName ?? "defaultName"
        
        self.title = room.name       // name to the controller
        
        // to delete the place of the avatar at each msg
        self.collectionView.collectionViewLayout.incomingAvatarViewSize = .zero
        self.collectionView.collectionViewLayout.outgoingAvatarViewSize = .zero

        let date = Date()
        
        DBManager.manager.observeNewMessage(by: room) { (msg) in
            
            //make sound only if new msg - if msg date is bigger than date
            let shouldPlaySound = msg.date.timeIntervalSince(date) > 0

            //add new message to array
            self.messages.append(msg)
            
            let isOutgoing = msg.senderId == self.senderId
            if isOutgoing{
                //refresh UI
                self.finishSendingMessage()
                
                //make sound of msg
                if shouldPlaySound{
                    JSQSystemSoundPlayer.jsq_playMessageSentSound()
                }
            } else {
                //refresh UI
                self.finishReceivingMessage()
                
                //make sound of msg
                if shouldPlaySound{
                    JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
                }
            }
        }
        
    }

    //Mark: - CollectionView Maintenance
    
    // 2 must methods of the coolection view
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]  // what message
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count   // how many messages
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        // accured when download cell
        guard let userId = messages[indexPath.item].senderId else{
            return nil
        }
        
        if userId == self.senderId{
            return outgoingBubble
        } else {
            return bubbleImageFor(uid: userId)
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    // lets add user name in each msg - name text
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        guard let name = messages[indexPath.item].senderDisplayName, !name.isEmpty else {
            return nil
        }
        
        return NSAttributedString(string: name)
    }
    
    // make place to the name above - name height
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        guard let name = messages[indexPath.item].senderDisplayName, !name.isEmpty else {
            return 0
        }
        
        return 17
    }
    
    // time text
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellBottomLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let msg = messages[indexPath.item]
        let str = msg.date.timeString
        
        return NSAttributedString(string: str)
    }
    
    //time height
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellBottomLabelAt indexPath: IndexPath!) -> CGFloat {
        
        return 17
    }
    
    //Mark: - Messages Maintenance
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        guard let text = text, !text.isEmpty else {
            return
        }
        
        DBManager.manager.createMessage(with: text, room: self.room)
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        //TODO: - implement to send image
    }
    
    func bubbleImageFor(uid : String) -> JSQMessagesBubbleImage?{
        guard incomingBubbles[uid] == nil else{
            //already exit bubble for this uid
            return incomingBubbles[uid]
        }
        
        //create new bubble
        let factory = JSQMessagesBubbleImageFactory()!
        guard let bubble = factory.incomingMessagesBubbleImage(with: UIColor.randomColor) else{
            return nil
        }
        
        incomingBubbles[uid] = bubble
        
        return bubble
    }

    
}
