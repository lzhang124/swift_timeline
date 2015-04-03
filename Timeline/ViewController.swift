//
//  ViewController.swift
//  Timeline
//
//  Created by Larry Zhang on 4/1/15.
//  Copyright (c) 2015 Larry Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var scroll: UIScrollView!
    var timeline: TimelineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var backColor = UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1.000)
        scroll.backgroundColor = backColor
        
        timeline = TimelineView(timeFrames: [
            TimeFrame(time: "9:47 AM", image: UIImage(named: "jenn.png")),
            TimeFrame(time: "10:23 AM", image: UIImage(named: "yasyf.png")),
            TimeFrame(time: "11:58 AM", image: UIImage(named: "david.png")),
            TimeFrame(time: "12:06 PM", image: UIImage(named: "rumya.png")),
            TimeFrame(time: "1:34 PM", image: UIImage(named: "rose.png")),
            TimeFrame(time: "1:40 PM", image: UIImage(named: "tim.png")),
            TimeFrame(time: "2:11 PM", image: UIImage(named: "jaimie.png")),
            TimeFrame(time: "3:00 PM", image: UIImage(named: "emma.png")),
            TimeFrame(time: "4:29 PM", image: UIImage(named: "blake.png")),
            ])
        
        scroll.addSubview(timeline)
        scroll.addConstraints([
            NSLayoutConstraint(item: timeline, attribute: .Left, relatedBy: .Equal, toItem: scroll, attribute: .Left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: scroll, attribute: .Bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Top, relatedBy: .Equal, toItem: scroll, attribute: .Top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Right, relatedBy: .Equal, toItem: scroll, attribute: .Right, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: timeline, attribute: .Width, relatedBy: .Equal, toItem: scroll, attribute: .Width, multiplier: 1.0, constant: 0)
            ])

    }

}

