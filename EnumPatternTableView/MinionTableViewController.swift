//
//  MinionTableViewController.swift
//  EnumPatternTableView
//
//  Created by Natasha Murashev on 7/13/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class MinionTableViewController: UITableViewController {

    let numberOfMinions = 9
    let minionCellIdentifier = "minionCell"
    
    enum MinionIndex: Int {
        case DAVE, BOB, JERRY, JORGE, KEVIN, MARK, PHIL, STUART, TIM
        
        static let minionNames = [
            DAVE : "Dave", BOB : "Bob", JERRY : "Jerry",
            JORGE : "Jorge", KEVIN : "Kevin", MARK : "Mark",
            PHIL : "Phil", STUART : "Stuart", TIM : "Tim"]
        
        func minionName() -> String {
            if let minionName = MinionIndex.minionNames[self] {
                return minionName
            } else {
                return "Minion"
            }
        }
        
        func minionImage() -> UIImage {
            return UIImage(named: "Minion\(minionName())")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {

        return numberOfMinions
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier(minionCellIdentifier) as UITableViewCell
        
        let minionIndex = MinionIndex.fromRaw(indexPath.row) as MinionIndex
        
        cell.textLabel.text = minionIndex.minionName()
        cell.imageView.image = minionIndex.minionImage()
        
        return cell
    }

}
