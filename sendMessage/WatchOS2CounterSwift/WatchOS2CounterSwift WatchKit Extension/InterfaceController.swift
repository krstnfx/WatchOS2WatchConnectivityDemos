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
    
    private var counter = 0
    
    private let session : WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    

    override init() {
        super.init()
        
        session?.delegate = self
        session?.activateSession()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
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
        let applicationData = ["counterValue" : counter]
        
        session?.sendMessage(applicationData,
            replyHandler: { replyData in
                // handle reply from iPhone app here
                print(replyData)
            }, errorHandler: { error in
                // catch any errors here
                print(error)
        })
    }
    
    private func setCounterLabelText() {
        counterLabel.setText(String(counter))
    }
    
}
