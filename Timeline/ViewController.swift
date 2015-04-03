//
//  ViewController.swift
//  Timeline
//
//  Created by Larry Zhang on 4/3/15.
//  Copyright (c) 2015 Larry Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var people = [
        (time: "9:47 AM", image: UIImage(named: "jenn.png"), name: "Jenn"),
        (time: "10:23 AM", image: UIImage(named: "yasyf.png"), name: "Yasyf"),
        (time: "11:58 AM", image: UIImage(named: "david.png"), name: "David"),
        (time: "12:06 PM", image: UIImage(named: "rumya.png"), name: "Rumya"),
        (time: "1:34 PM", image: UIImage(named: "rose.png"), name: "Rose"),
        (time: "1:40 PM", image: UIImage(named: "tim.png"), name: "Tim"),
        (time: "2:11 PM", image: UIImage(named: "jaimie.png"), name: "Jaimie"),
        (time: "3:00 PM", image: UIImage(named: "emma.png"), name: "Emma"),
        (time: "4:29 PM", image: UIImage(named: "blake.png"), name: "Blake"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.registerNib(UINib(nibName: "Person", bundle: nil), forCellReuseIdentifier: "Person")

        let footer = UIView()
        footer.frame = CGRect(origin: CGPointZero, size: CGSize(width: 0, height: 25))
        table.tableFooterView = footer
    }

    // MARK: - Table view data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Person", forIndexPath: indexPath) as Person
        
        cell.timeStamp.text = people[indexPath.row].time
        cell.profilePicture.image = people[indexPath.row].image
        cell.profilePicture.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [231.0/255.0, 145.0/255.0, 42.0/255.0, 1.0])
        cell.name.text = people[indexPath.row].name
        
        return cell
    }

}

