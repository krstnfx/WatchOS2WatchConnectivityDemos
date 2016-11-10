//
//  ViewController.swift
//  WatchOS2LastEmojiSwift
//
//  Created by Thai, Kristina on 6/21/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession) {
        //Dummy Implementation
    }
    
    /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession) {
        //Dummy Implementation
    }
    
    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(iOS 9.3, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //Dummy Implementation
    }

    @IBOutlet weak var emojiLabel: UILabel!
    
    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureWCSession()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureWCSession()
    }
    
    fileprivate func configureWCSession() {
        session?.delegate = self;
        session?.activate()
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let emoji = applicationContext["emoji"] as? String
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        DispatchQueue.main.async {
            if let emoji = emoji {
                self.emojiLabel.text = "Last emoji: \(emoji)"
            }
        }
    }
}

