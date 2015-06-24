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
        
        session.sendMessage(applicationData, replyHandler: {([String : AnyObject]) -> Void in
            // handle reply from iPhone app here
        }, errorHandler: {(error ) -> Void in
            // catch any errors here
        })
        
    }
    
    func setCounterLabelText() {
        counterLabel.setText(String(counter))
    }
    
}
