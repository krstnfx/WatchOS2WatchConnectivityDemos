//
//  ViewController.swift
//  WatchOS2CounterSwift
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    private var counterData = [Int]()
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureWCSession()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureWCSession()
    }
    
    private func configureWCSession() {
        session?.delegate = self;
        session?.activateSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: WCSessionDelegate
extension ViewController: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            if let counterValue = message["counterValue"] as? Int {
                self.counterData.append(counterValue)
                self.mainTableView.reloadData()
            }
        }
    }
}

// MARK: Table View Data Source
extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CounterCell"
        let cell = mainTableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let counterValueString = String(counterData[indexPath.row])
        cell.textLabel?.text = counterValueString
        
        return cell
    }
}

