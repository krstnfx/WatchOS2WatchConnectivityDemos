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

    @IBOutlet weak var emojiLabel: UILabel!
    var session : WCSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }
    }

    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let emoji = applicationContext["emoji"] as? String
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            self.emojiLabel.text = "Last emoji: " + emoji!
        }
    }
    
    


}

