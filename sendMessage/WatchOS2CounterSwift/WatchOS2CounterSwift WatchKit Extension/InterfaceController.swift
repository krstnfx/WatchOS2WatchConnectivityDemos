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
    
    @IBOutlet var counterLabel: WKInterfaceLabel!
    var counter = 0
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

    @IBAction func incrementCounter() {
        counter++
        setCounterLabelText()
    }
    
    @IBAction func clearCounter() {
        counter = 0
        setCounterLabelText()
    }
    
    @IBAction func saveCounter() {
        let applicationData = ["counterValue":String(counter)]
        
        // The paired iPhone has to be connected via Bluetooth.
        if let session = session where session.reachable {
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
    
    func setCounterLabelText() {
        counterLabel.setText(String(counter))
    }
    
}
