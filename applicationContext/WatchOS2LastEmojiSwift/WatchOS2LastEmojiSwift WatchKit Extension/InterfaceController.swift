//
//  InterfaceController.swift
//  WatchOS2LastEmojiSwift WatchKit Extension
//
//  Created by Thai, Kristina on 6/21/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var session : WCSession!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func catPressed() {
        sendEmoji("cat")
    }
    
    @IBAction func dogPressed() {
        sendEmoji("dog")
    }

    @IBAction func pandaPressed() {
        sendEmoji("panda")
    }
    
    @IBAction func bunnyPressed() {
        sendEmoji("bunny")
    }
    
    @IBAction func cowPressed() {
        sendEmoji("cow")
    }
    
    @IBAction func hamsterPressed() {
        sendEmoji("hamster")
    }
    
    func sendEmoji(emoji: String){
        let applicationDict = ["emoji":emoji]
        do {
            try session.updateApplicationContext(applicationDict)
        } catch {
            print("error")
        }
    }
}
