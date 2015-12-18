//
//  ViewController.swift
//  WatchOS2TransferImageSwift
//
//  Created by Thai, Kristina on 12/6/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    private let session : WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        session?.delegate = self
        session?.activateSession()
    }
    
    func session(session: WCSession, didReceiveFile file: WCSessionFile) {
        dispatch_async(dispatch_get_main_queue()) {
            self.loadingLabel.hidden = true;
            let imageData = NSData.init(contentsOfURL: file.fileURL)
            self.imageView.image = UIImage(data: imageData!)
        }
    }


}

