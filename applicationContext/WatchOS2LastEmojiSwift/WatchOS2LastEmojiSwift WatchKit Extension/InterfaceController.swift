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
    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(watchOS 2.2, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //Dummy Implementation
    }

    
    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    override init() {
        super.init()
        
        session?.delegate = self
        session?.activate()
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    override func willActivate() {
        super.willActivate()
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
    
    func sendEmoji(_ emoji: String){
        let applicationDict = ["emoji" : emoji]
        do {
            try session?.updateApplicationContext(applicationDict)
        } catch {
            print("error")
        }
    }
}
