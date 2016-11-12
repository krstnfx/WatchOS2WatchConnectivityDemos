//
//  InterfaceController.swift
//  WatchOS2CounterSwift WatchKit Extension
//
//  Created by Thai, Kristina on 6/20/15.
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

    
    @IBOutlet var counterLabel: WKInterfaceLabel!
    
    fileprivate var counter = 0
    
    fileprivate let session : WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    

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

    @IBAction func incrementCounter() {
        counter += 1
        setCounterLabelText()
    }
    
    @IBAction func clearCounter() {
        counter = 0
        setCounterLabelText()
    }
    
    @IBAction func saveCounter() {
        let applicationData = ["counterValue" : counter]
        
        // The paired iPhone has to be connected via Bluetooth.
        if let session = session, session.isReachable {
            session.sendMessage(applicationData,
                replyHandler: { replyData in
                    // handle reply from iPhone app here
                    print(replyData)
                }, errorHandler: { error in
                    // catch any errors here
                    print(error)
            })
        } else {
            // when the iPhone is not connected via Bluetooth
        }
    }
    
    fileprivate func setCounterLabelText() {
        counterLabel.setText(String(counter))
    }
    
}
