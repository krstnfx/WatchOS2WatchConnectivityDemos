//
//  InterfaceController.swift
//  WatchOS2TransferImage WatchKit Extension
//
//  Created by Thai, Kristina on 11/8/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    private let session : WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    override init() {
        super.init()
        
        session?.delegate = self
        session?.activateSession()
    }
    
    @IBAction func sendDogs() {
        let filePath = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("dogs", ofType: "png")!)

        self.session?.transferFile(filePath, metadata: nil)

    }
    
    func session(session: WCSession, didFinishFileTransfer fileTransfer: WCSessionFileTransfer, error: NSError?) {
        print("error: ", error)
    }
}
