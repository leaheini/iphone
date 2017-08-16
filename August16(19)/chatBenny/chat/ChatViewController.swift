//
//  ChatViewController.swift
//  chat
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase

class ChatViewController: JSQMessagesViewController {
    
    var room : Room!
    let outgoingBubble : JSQMessagesBubbleImage
    //let incomingBubble : JSQMessagesBubbleImage
    var incomingBubbles : [String:JSQMessagesBubbleImage] = [:]
    
    required init?(coder aDecoder: NSCoder) {
        let factory = JSQMessagesBubbleImageFactory()!
        outgoingBubble = factory.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        //incomingBubble = factory.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())

        super.init(coder: aDecoder)
        
    }
    
    deinit{
        DBManager.manager.messagesRef.child(room.id).removeAllObservers()
    }

    var messages : [JSQMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.senderId = Auth.auth().currentUser?.uid
        self.senderDisplayName = Auth.auth().currentUser?.displayName ?? "foo"

        self.title = room.name
        
        self.collectionView.collectionViewLayout.incomingAvatarViewSize = .zero
        self.collectionView.collectionViewLayout.outgoingAvatarViewSize = .zero
        
        let date = Date()
        
        DBManager.manager.observeNewMessage(by: room) { (msg) in
            //should play sound if message date is bigger than date
            let shouldPlaySound = msg.date.timeIntervalSince(date) > 0
            
            //add new message to array
            self.messages.append(msg)
            
            let isOutgoing = msg.senderId == self.senderId
            if isOutgoing{
                //refresh ui
                self.finishSendingMessage()
                //make sound
                if shouldPlaySound{
                    JSQSystemSoundPlayer.jsq_playMessageSentSound()
                }
            } else {
                //refresh ui
                self.finishReceivingMessage()
                //make sound
                if shouldPlaySound{
                    JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
                }
            }
        }
    }

    //MARK: - Messages Maintenance
    
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
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        guard let text = text, !text.isEmpty else{
            return
        }
        
        DBManager.manager.createMessage(with: text, room: self.room)
        
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        //TODO: - implement send image
    }
    
    //MARK: - CollectionView Maintenance
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        guard let userId = messages[indexPath.item].senderId else{
            return nil
        }
        
        if userId == self.senderId{
            return outgoingBubble
        } else {
            return bubbleImageFor(uid: userId)
        }
        
    }

    //name text
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        guard let name = messages[indexPath.item].senderDisplayName, !name.isEmpty else{
            return nil
        }
        
        return NSAttributedString(string: name)
        
    }
    
    //name height
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        guard let name = messages[indexPath.item].senderDisplayName, !name.isEmpty else{
            return 0
        }
        
        return 17
        
    }
    
    //time text
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellBottomLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let msg = messages[indexPath.item]
        let str = msg.date.timeString
        
        return NSAttributedString(string: str)
    }
    
    //time height
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellBottomLabelAt indexPath: IndexPath!) -> CGFloat {
        
        return 17
        
    }
}



















