//
//  ChatViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 5/22/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation
class ChatViewController: JSQMessagesViewController  {
    
    //array of messages to show in collection view
    var messages: [JSQMessage] = []
    
    var keptProductSKU: String?
    
    var messageListener: MessageListener?
    
    //bubble design and colors
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        
        if let sku = keptProductSKU {
            fetchMessages(sku, {
                messages in
                
                for m in messages {
                    self.messages.append(JSQMessage(senderId: m.senderID, senderDisplayName: m.senderID, date: m.date, text: m.message))
                }
                self.finishReceivingMessage()
            })
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if let sku = keptProductSKU {
            messageListener = MessageListener(keptProductSKU: sku, startDate: NSDate(), callback: {
                message in
                self.messages.append(JSQMessage(senderId: message.senderID, senderDisplayName: message.senderID, date: message.date, text: message.message))
                self.finishReceivingMessage()
            })
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        messageListener?.stop()
    }
    
    override var senderDisplayName: String! {
        get {
            return currentUser()!.name
        }
        set {
            super.senderDisplayName = newValue
        }
    }
    
    override var senderId: String! {
        get {
            return currentUser()!.id
        }
        set {
            super.senderId = newValue
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        var data = self.messages[indexPath.row]
        return data
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        var data = self.messages[indexPath.row]
        
        if data.senderId == PFUser.currentUser()?.objectId {
            return outgoingBubble
        }
        else {
            return incomingBubble
        }
    }
    
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        let m = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        //self.messages.append(m)
        
        if let sku = keptProductSKU {
            saveMessage(sku, Message(message: text, senderID: senderId, date: date))
        }
        finishSendingMessage()
    }
}