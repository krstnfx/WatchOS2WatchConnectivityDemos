//
//  ViewController.swift
//  WatchOS2TransferGif
//
//  Created by Thai, Kristina on 11/8/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (WCSession.isSupported()) {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func session(session: WCSession, didReceiveFile file: WCSessionFile) {
        dispatch_async(dispatch_get_main_queue()) {
            self.loadingLabel.hidden = true;
            let imageData = NSData.init(contentsOfURL: file.fileURL)
            self.imageView.image = UIImage(data: imageData!)
        }
    }


}

