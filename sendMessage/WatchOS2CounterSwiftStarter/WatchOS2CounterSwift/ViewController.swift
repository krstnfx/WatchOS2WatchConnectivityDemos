//
//  ViewController.swift
//  WatchOS2CounterSwift
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    var counterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CounterCell"
        let cell = self.mainTableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let counterValueString = self.counterData[indexPath.row]
        cell.textLabel?.text = counterValueString
        
        return cell
    }

}

