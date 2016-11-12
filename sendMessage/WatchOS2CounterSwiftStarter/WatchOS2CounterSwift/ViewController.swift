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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CounterCell"
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let counterValueString = self.counterData[indexPath.row]
        cell.textLabel?.text = counterValueString
        
        return cell
    }

}

