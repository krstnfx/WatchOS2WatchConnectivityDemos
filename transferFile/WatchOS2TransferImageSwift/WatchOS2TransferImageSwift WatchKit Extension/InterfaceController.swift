//
//  InterfaceController.swift
//  WatchOS2TransferImageSwift WatchKit Extension
//
//  Created by Thai, Kristina on 12/6/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
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

    
    fileprivate let session : WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    override init() {
        super.init()
        
        session?.delegate = self
        session?.activate()
    }
    
    @IBAction func sendDogs() {
        let filePath = URL(fileURLWithPath: Bundle.main.path(forResource: "dogs", ofType: "png")!)
        self.session?.transferFile(filePath, metadata: nil)
    }
    
    func session(_ session: WCSession, didFinish fileTransfer: WCSessionFileTransfer, error: Error?) {
        print("error: ", error)
    }
}
